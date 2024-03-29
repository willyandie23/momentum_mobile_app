import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_momentum_app/screens/pages/profile_screen.dart';
import 'package:flutter_momentum_app/screens/pages/setting_screen.dart';

import '../pages/home_screen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int myCurrentIndex = 0;
  List pages = const [
    HomeScreen(),
    ProfileScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: ClipRRect(
          child: BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            unselectedItemColor: Colors.grey,
            currentIndex: myCurrentIndex,
            showUnselectedLabels: false,
            onTap: (index) {
              setState(() {
                myCurrentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
              ),
            ],
          ),
        ),
      ),
      body: pages[myCurrentIndex],
    );
  }
}
