import 'package:cricket_stats/SR/sr_bloc.dart';
import 'package:cricket_stats/SR/sr_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sr_state.dart';
import '../Utility/glassCard.dart';

class StrikeRateTab extends StatefulWidget {
  const StrikeRateTab({super.key});

  @override
  State<StrikeRateTab> createState() => _StrikeRateTabState();
}

class _StrikeRateTabState extends State<StrikeRateTab> {
  final ballsController = TextEditingController();
  final wktsController = TextEditingController();

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
                  _input("Overs Bowled", ballsController),
                  const SizedBox(height: 12),
                  _input("Wkts Taken", wktsController),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: _btnStyle,
                    onPressed: () {
                      final myBalls = int.tryParse(ballsController.text) ?? 0;
                      final wkts = int.tryParse(wktsController.text) ?? 0;

                      context.read<SrBloc>().add(
                        PressButton(wkts: wkts, overs: myBalls),
                      );
                    },
                    child: const Text("Calculate"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            BlocBuilder<SrBloc, SrState>(
              builder: (context, state) {
                return TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: state.SR),
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
                          "Bowler's Strike Rate",
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
                ballsController.clear();
                wktsController.clear();
                context.read<SrBloc>().add(ResetSrEvent());
              },
              child: const Text("Clear All"),
            ),
          ],
        ),
      ),
    );
  }
}
