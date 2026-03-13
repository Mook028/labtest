import 'package:flutter/material.dart';
import 'checkin_screen.dart';
import 'finish_class_screen.dart';
import 'history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Class Check-in'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildActionCard(
              context,
              title: 'Check-in',
              icon: Icons.login_rounded,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CheckInScreen()),
              ),
            ),
            const SizedBox(height: 16),
            _buildActionCard(
              context,
              title: 'Finish Class',
              icon: Icons.check_circle_outline_rounded,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FinishClassScreen()),
              ),
            ),
            const SizedBox(height: 16),
            _buildActionCard(
              context,
              title: 'View History',
              icon: Icons.history_rounded,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryScreen()),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey.shade500,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 10,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded, size: 28), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded, size: 28), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined, size: 28), label: 'Settings'),
        ],
      ),
    );
  }

  Widget _buildActionCard(BuildContext context, {required String title, required IconData icon, required VoidCallback onTap}) {
    return Card(
      elevation: 2,
      shadowColor: Colors.blue.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: Theme.of(context).primaryColor, size: 32),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded, color: Colors.blue.shade200, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
