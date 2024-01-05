import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_momentum_app/screens/widget/navigation_menu.dart';

class MemoryMomentumScreen extends StatefulWidget {
  const MemoryMomentumScreen({super.key});

  @override
  State<MemoryMomentumScreen> createState() => _MemoryMomentumScreenState();
}

class _MemoryMomentumScreenState extends State<MemoryMomentumScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hi. MemoryScreen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // bottomNavigationBar: NavigationMenu(),
    );
  }
}
