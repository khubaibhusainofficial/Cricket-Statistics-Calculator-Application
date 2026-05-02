import 'package:cricket_stats/Utility/build_card.dart';
import 'package:flutter/material.dart';

class BowlerAverageCard extends StatelessWidget {
  const BowlerAverageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return StatCard(
      title: "Bowler Average",
      formula: "Average = Runs Conceded / Wickets Taken",
      colors: [Color(0xFFFF512F), Color(0xFFDD2476)],
      shadow: Colors.redAccent,
      icon: Icons.analytics,
    );
  }
}