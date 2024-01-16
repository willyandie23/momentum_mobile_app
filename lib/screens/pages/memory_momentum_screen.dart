import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:transparent_image/transparent_image.dart';
// import 'package:flutter_momentum_app/screens/widget/navigation_menu.dart';

class MemoryMomentumScreen extends StatefulWidget {
  const MemoryMomentumScreen({super.key});

  @override
  State<MemoryMomentumScreen> createState() => _MemoryMomentumScreenState();
}

class _MemoryMomentumScreenState extends State<MemoryMomentumScreen> {
  List<String> imageList = [
    'assets/memory/1.jpeg',
    'assets/memory/2.jpeg',
    'assets/memory/3.jpeg',
    'assets/memory/4.jpeg',
    'assets/memory/5.jpeg',
    'assets/memory/6.jpeg',
    'assets/memory/7.jpeg',
    'assets/memory/8.jpeg',
    'assets/memory/9.jpeg',
    'assets/memory/10.jpeg',
    'assets/memory/11.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Memory Momentum'),
      ),
      body: Container(
        margin: const EdgeInsets.all(12.0),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
          itemCount: imageList.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                child: Image.asset(
                  imageList[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
