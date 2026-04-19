import 'package:flutter/material.dart';
import 'Profile/profile_screen.dart';
import 'Setting/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // 1. A list of titles to match your pages
  final List<String> _titles = ["Home", "Profile", "Settings"];

  final List<Widget> _pages = [
    const Center(child: Text("Home Content")),
    const ProfileScreen(),
    const SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        // 2. Dynamic Title: Changes based on the selected tab
        title: Text(_titles[_selectedIndex]),
        actions: [
          IconButton(
            onPressed: () {
              _onItemTapped(2); 
            },
            icon: const Icon(Icons.settings, color: Colors.white),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // 4. Update labels to match the actual screens
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.teal,
      ),
    );
  }
}
