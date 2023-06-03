import 'package:flutter/material.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({super.key});

  @override
  State<AnimatedCrossFadeWidget> createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool toggle = false;

  void onChangeAnimation() {
    setState(() {
      toggle = !toggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedCrossFade example'),
      ),
      body: Center(
        child: AnimatedCrossFade(
          firstChild: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(color: Colors.green),
          ),
          secondChild: Container(
            width: 50,
            height: 50,
            decoration:
                const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
          ),
          crossFadeState:
              toggle ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(seconds: 3),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('start'),
        onPressed: () => onChangeAnimation(),
      ),
    );
  }
}
