import 'package:flutter/material.dart';
import 'package:movie/pages/explore_page.dart';
import 'package:movie/pages/home_page.dart';
import 'package:movie/pages/save_page.dart';
import 'package:movie/pages/settings_page.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({super.key});

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  final List _screens = [
    const HomePage(),
    const ExplorePage(),
    const SavePage(),
    const SettingsPage()
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/navigation_bar/home.png",
              width: 30,
              height: 30,
              color: _currentIndex == 0 ? const Color(0xFF54A8E5) : null,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/navigation_bar/explore.png",
              width: 30,
              height: 30,
              color: _currentIndex == 1 ? const Color(0xFF54A8E5) : null,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/navigation_bar/save.png",
              width: 25,
              height: 25,
              color: _currentIndex == 2 ? const Color(0xFF54A8E5) : null,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/navigation_bar/profile.png",
              width: 30,
              height: 30,
              color: _currentIndex == 3 ? const Color(0xFF54A8E5) : null,
            ),
            label: "",
          ),
        ],
      ),
      body: _screens[_currentIndex],
    );
  }
}
