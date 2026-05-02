import 'package:cricket_stats/Hive_DB/Models/getData.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import '../Hive_DB/Models/model_stats.dart';
import '../Hive_DB/enum/myEnum.dart';

class StatsHistoryScreen extends StatelessWidget {
  const StatsHistoryScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final box = MyBoxes.getMyData();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cricket Stats History"),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box<ModelStats> box, _) {
          final data = box.values.toList().reversed.toList();

          if (data.isEmpty) {
            return const Center(
              child: Text(
                "No Stats Available",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return _buildStatCard(item, index, box);
            },
          );
        },
      ),
    );
  }

  Widget _buildStatCard(ModelStats item, int index, Box box) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _getGradient(item.type),
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),

        // 🔥 TITLE
        title: Text(
          _getTitle(item.type),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        // 📊 DETAILS
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),

            Text(
              "Result: ${item.result.toStringAsFixed(2)}",
              style: const TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 4),

            Text(
              "Inputs: ${item.input}",
              style: const TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 4),

            Text(
              DateFormat('dd MMM yyyy • hh:mm a')
                  .format(item.createdAt),
              style: const TextStyle(color: Colors.white60, fontSize: 12),
            ),
          ],
        ),

        // 🗑 DELETE BUTTON
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.white),
          onPressed: () {
            box.deleteAt(index);
          },
        ),
      ),
    );
  }

  // 🎨 Dynamic Colors per Stat Type
  List<Color> _getGradient(StatType type) {
    switch (type) {
      case StatType.BAT_AVG:
        return [Colors.blue, Colors.indigo];
      case StatType.BAT_SR:
        return [Colors.green, Colors.teal];
      case StatType.BOWL_AVG:
        return [Colors.orange, Colors.deepOrange];
      case StatType.BOWL_SR:
        return [Colors.purple, Colors.deepPurple];
      case StatType.BOWL_ECONOMY:
        return [Colors.red, Colors.pink];
    }
  }

  // 🏏 Titles
  String _getTitle(StatType type) {
    switch (type) {
      case StatType.BAT_AVG:
        return "Batting Average";
      case StatType.BAT_SR:
        return "Batting Strike Rate";
      case StatType.BOWL_AVG:
        return "Bowling Average";
      case StatType.BOWL_SR:
        return "Bowling Strike Rate";
      case StatType.BOWL_ECONOMY:
        return "Bowling Economy";
    }
  }
}
