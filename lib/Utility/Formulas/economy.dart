import 'package:cricket_stats/Utility/build_card.dart';
import 'package:flutter/material.dart';

class BowlerEconomyCard extends StatelessWidget {
  const BowlerEconomyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return StatCard(
      title: "Bowler Economy",
      formula: "Economy = Runs Conceded / Overs Bowled",
      colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
      shadow: Colors.deepPurple,
      icon: Icons.speed,
    );
  }
}
