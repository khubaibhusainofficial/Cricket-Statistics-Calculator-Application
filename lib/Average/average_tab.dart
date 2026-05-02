import 'package:cricket_stats/Average/avg_bloc.dart';
import 'package:cricket_stats/Average/avg_event.dart';
import 'package:cricket_stats/Average/avg_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Utility/glassCard.dart';

class AverageTab extends StatefulWidget {
  const AverageTab({super.key});

  @override
  State<AverageTab> createState() => _AverageTabState();
}

class _AverageTabState extends State<AverageTab> {
  final runsController = TextEditingController();
  final wicketsController = TextEditingController();

  Widget _input(String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.07),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  final ButtonStyle _btnStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    backgroundColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          GlassCard(
            child: Column(
              children: [
                _input("Runs Conceded", runsController),
                const SizedBox(height: 12),
                _input("Wickets", wicketsController),
                const SizedBox(height: 20),

                ElevatedButton(
                  style: _btnStyle,
                  onPressed: () {
                    final rc = int.tryParse(runsController.text) ?? 0;
                    final wkt = int.tryParse(wicketsController.text) ?? 0;
                    context.read<AvgBloc>().add(ButtonHit(runs: rc, wkts: wkt));
                  },
                  child: const Text("Calculate"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          BlocBuilder<AvgBloc, AvgState>(
            builder: (context, state) {
              return TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: state.average),
                duration: const Duration(milliseconds: 600),
                curve: Curves.decelerate,
                builder: (context, value, _) {
                  return Column(
                    children: [
                      Text(
                        value.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Bowler's Average",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  );
                },
              );
            },
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              runsController.clear();
              wicketsController.clear();
              context.read<AvgBloc>().add(ResetAll());
            },
            child: const Text("Clear All"),
          ),
        ],
      ),
    );
  }
}
