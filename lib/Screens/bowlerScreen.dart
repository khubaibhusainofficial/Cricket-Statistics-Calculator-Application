import 'package:flutter/material.dart';

import '../Average/average_tab.dart';
import '../Economy/economy_tab.dart';
import '../SR/strike_rate_tab.dart';

class BowlerScreen extends StatelessWidget {
  const BowlerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bowler Stats"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Avg"),
              Tab(text: "Econ"),
              Tab(text: "SR"),
            ],
          ),
        ),

        body: const TabBarView(
          children: [
            AverageTab(),
            EconomyTab(),
            StrikeRateTab(),
          ],
        ),
      ),
    );
  }
}
