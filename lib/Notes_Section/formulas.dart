import 'package:cricket_stats/Utility/Formulas/batAvg.dart';
import 'package:cricket_stats/Utility/Formulas/bat_SR.dart';
import 'package:cricket_stats/Utility/Formulas/bowl_SR.dart';
import 'package:cricket_stats/Utility/Formulas/bowl_avg.dart';
import 'package:cricket_stats/Utility/Formulas/economy.dart';
import 'package:flutter/material.dart';

class MyFormulas extends StatelessWidget {
  const MyFormulas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "All Formulas",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
          ),
          SizedBox(height: 10),
          StrikeRateCard(),
          BatsmanAverageCard(),
          BowlerAverageCard(),
          BowlerEconomyCard(),
          BowlerStrikeRateCard()
        ],
      ),
    );
  }
}
