import 'package:cricket_stats/Utility/build_card.dart';
import 'package:flutter/material.dart';
class BowlerStrikeRateCard extends StatelessWidget {
  const BowlerStrikeRateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return StatCard(
      title: "Bowler Strike Rate",
      formula: "SR = Balls Bowled / Wickets Taken",
      colors: [Color(0xFF56CCF2), Color(0xFF2F80ED)],
      shadow: Colors.blue,
      icon: Icons.bolt,
    );
  }
}
