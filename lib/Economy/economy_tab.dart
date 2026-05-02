import 'package:cricket_stats/Economy/economy_bloc.dart';
import 'package:cricket_stats/Economy/economy_event.dart';
import 'package:cricket_stats/Economy/economy_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Utility/glassCard.dart';

class EconomyTab extends StatefulWidget {
  const EconomyTab({super.key});

  @override
  State<EconomyTab> createState() => _EconomyTabState();
}

class _EconomyTabState extends State<EconomyTab> {
  final runsController = TextEditingController();
  final oversController = TextEditingController();

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
                  _input("Runs Conceded", runsController),
                  const SizedBox(height: 12),
                  _input("Overs", oversController),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: _btnStyle,
                    onPressed: () {
                      final runsC = int.tryParse(runsController.text) ?? 0;
                      final overs = double.tryParse(oversController.text) ?? 0;
                      context.read<EconomyBloc>().add(
                        ButtonPress(runs: runsC, overs: overs),
                      );
                    },
                    child: const Text("Calculate"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            BlocBuilder<EconomyBloc, EconomyState>(
              builder: (context, state) {
                return TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: state.economy),
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
                          "Bowler's Economy Rate",
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
                oversController.clear();
                context.read<EconomyBloc>().add(ResetResult());
              },
              child: const Text("Clear All"),
            ),
          ],
        ),
      ),
    );
  }
}
