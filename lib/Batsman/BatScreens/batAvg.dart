import 'package:cricket_stats/Batsman/Average_Calculation/average_batsman_event.dart';
import 'package:cricket_stats/Batsman/Average_Calculation/average_batsman_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Utility/glassCard.dart';
import '../Average_Calculation/average_batsman_bloc.dart';

class AverageTabBatsman extends StatefulWidget {
  const AverageTabBatsman({super.key});

  @override
  State<AverageTabBatsman> createState() => _AverageTabState();
}

class _AverageTabState extends State<AverageTabBatsman> {
  final runScoredController = TextEditingController();
  final dismissController = TextEditingController();

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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GlassCard(
              child: Column(
                children: [
                  _input("Runs Scored", runScoredController),
                  const SizedBox(height: 12),
                  _input("Times Dismissed", dismissController),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: _btnStyle,
                    onPressed: () {
                      final rs = int.tryParse(runScoredController.text) ?? 0;
                      final timeWkt = int.tryParse(dismissController.text) ?? 0;
                      context.read<AverageBatsmanBloc>().add(
                        CalculateButton(runs: rs, dismissals: timeWkt),
                      );
                    },
                    child: const Text("Calculate"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            BlocBuilder<AverageBatsmanBloc, AverageBatsmanState>(
              builder: (context, state) {
                return TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: state.averageBat),
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
                          "Batsman's Average",
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
                runScoredController.clear();
                dismissController.clear();
                context.read<AverageBatsmanBloc>().add(ResetAllValues());
              },
              child: const Text("Clear All"),
            ),
          ],
        ),
      ),
    );
  }
}
