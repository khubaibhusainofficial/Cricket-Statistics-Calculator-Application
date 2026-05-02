import 'package:cricket_stats/Notes_Section/formulas.dart';
import 'package:flutter/material.dart';
import '../Batsman/BatHome/batHome.dart';
import '../Screens/home_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  Widget? _currentScreen;

  void _openScreen(Widget screen) {
    setState(() {
      _currentScreen = screen;
    });
  }

  @override
  void initState() {
    super.initState();

    _currentScreen = Center(
      child: Text(
        "Click on Drawer to open desired screen",
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("🏏 Cricket Stats Calculator"),
        foregroundColor: Colors.white,
        elevation: 13,
        shadowColor: Colors.black,
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xff0f0c29),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff0f0c29), Color(0xff302b63), Color(0xff24243e)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              /// 🌟 HEADER (Premium Look)
              Container(
                height: 180,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.deepPurple, Colors.indigo],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "🏏 Cricket Stats",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Performance Analytics Hub",
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /// 🧭 MENU ITEMS
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  children: [
                    /// Bowler Card
                    _drawerTile(
                      icon: Icons.sports_cricket,
                      title: "Bowler Stats",
                      subtitle: "Average • Economy • Strike Rate",
                      onTap: () {
                        Navigator.pop(context);
                        _openScreen(const HomeScreen());
                      },
                    ),

                    const SizedBox(height: 12),

                    /// Batsman Card
                    _drawerTile(
                      icon: Icons.bar_chart,
                      title: "Batsman Stats",
                      subtitle: "Average • Strike Rate",
                      onTap: () {
                        Navigator.pop(context);
                        _openScreen(const BatHome());
                      },
                    ),

                    const SizedBox(height: 12),

                    /// Future Expansion Card
                    _drawerTile(
                      icon: Icons.insights,
                      title: "All Formulas",
                      subtitle: "Formulas Given",
                      onTap: () {
                        Navigator.pop(context);
                        _openScreen(const MyFormulas());
                      },
                    ),
                  ],
                ),
              ),

              /// FOOTER
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "v1.0 • Built for Performance",
                  style: TextStyle(color: Colors.white38, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),

      /// 🔥 This is the ONLY dynamic area
      body: _currentScreen ?? const SizedBox(), // initial blank screen
    );
  }

  Widget _drawerTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.08),
            Colors.white.withOpacity(0.03),
          ],
        ),
        border: Border.all(color: Colors.white12),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.white60, fontSize: 12),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 14,
          color: Colors.white54,
        ),
        onTap: onTap,
      ),
    );
  }
}
