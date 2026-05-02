import 'package:cricket_stats/Batsman/TabBar/batTabBar.dart';
import 'package:cricket_stats/SR/strike_rate_tab.dart';
import 'package:flutter/material.dart';
import '../../Average/average_tab.dart';
import '../BatScreens/batAvg.dart';
import '../BatScreens/batSR.dart';

class BatHome extends StatelessWidget {
  const BatHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            /// 🌈 Gradient Background
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff0f0c29),
                    Color(0xff302b63),
                    Color(0xff24243e),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),

            /// 🔵 Glow Effect
            Positioned(
              top: -100,
              left: -50,
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            /// 🟣 Glow Effect
            Positioned(
              bottom: -120,
              right: -60,
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  /// Title
                  const Text(
                    "🏏 Batsman Stats",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  /// 🔥 Custom Tab Bar
                  BatTabBar(),
                  const SizedBox(height: 20),
                  /// Tab Views
                  const Expanded(
                    child: TabBarView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        AverageTabBatsman(),
                        StrikeRateBatsman(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
