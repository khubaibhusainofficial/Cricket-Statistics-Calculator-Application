import 'package:cricket_stats/Batsman/Batsman_SR/bat_sr_bloc.dart';
import 'package:cricket_stats/Batsman/Batsman_SR/bat_sr_event.dart';
import 'package:cricket_stats/Batsman/Batsman_SR/bat_sr_state.dart';
import 'package:cricket_stats/SR/sr_bloc.dart';
import 'package:cricket_stats/SR/sr_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Utility/glassCard.dart';

class StrikeRateBatsman extends StatefulWidget {
  const StrikeRateBatsman({super.key});

  @override
  State<StrikeRateBatsman> createState() => _StrikeRateBatsmanState();
}

class _StrikeRateBatsmanState extends State<StrikeRateBatsman> {
  final runControl = TextEditingController();
  final ballControl = TextEditingController();

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
                  _input("Runs Scored", runControl),
                  const SizedBox(height: 12),
                  _input("Balls Played", ballControl),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: _btnStyle,
                    onPressed: () {
                      final myRuns = int.tryParse(runControl.text) ?? 0;
                      final myBalls = int.tryParse(ballControl.text) ?? 0;

                      context.read<BatSrBloc>().add(
                        ClickHere(run: myRuns, ball: myBalls),
                      );
                    },
                    child: const Text("Calculate"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            BlocBuilder<BatSrBloc, BatSrState>(
              builder: (context, state) {
                return TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: state.srBat),
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
                runControl.clear();
                ballControl.clear();
                context.read<BatSrBloc>().add(ResetBatSR());
              },
              child: const Text("Clear All"),
            ),
          ],
        ),
      ),
    );
  }
}
