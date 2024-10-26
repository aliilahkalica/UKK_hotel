import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ukk_hotel/beranda.dart';
import 'package:ukk_hotel/history.dart';

class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Beranda(),
    const History(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
              backgroundColor: Colors.white,
              color: Color.fromARGB(255, 14, 63, 169),
              activeColor: Color.fromARGB(255, 14, 63, 169),
              tabBackgroundColor: Color.fromARGB(255, 214, 227, 255),
              gap: 8,
              padding: EdgeInsets.all(16),
              onTabChange: _onItemTapped,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.shop,
                  text: 'History',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ]),
        ),
      ),
    );
  }
}
