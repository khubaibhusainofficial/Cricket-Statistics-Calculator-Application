import 'package:flutter/material.dart';

class PremiumTabBar extends StatelessWidget {
  const PremiumTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.09),
        borderRadius: BorderRadius.circular(40),
      ),
      child: TabBar(
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xff00c6ff), Color(0xff0072ff)],
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        labelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: const [
          Tab(text: "Economy"),
          Tab(text: "Average"),
          Tab(text: "Strike Rate"),
        ],
      ),
    );
  }
}
