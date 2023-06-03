import 'package:flutter/material.dart';

class NavigationAnimation extends StatelessWidget {
  const NavigationAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation animation example'),
      ),
      body: const Center(child: Text('Second page')),
    );
  }
}
