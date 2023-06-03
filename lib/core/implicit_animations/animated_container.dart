import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  bool toggle = true;

  void onChangeAnimation() {
    setState(() {
      toggle = !toggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer example'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 3),
          curve: Curves.easeIn,
          onEnd: () {
            print('Animated container stop');
          },
          width: toggle ? 120 : 60,
          height: toggle ? 120 : 60,
          decoration: toggle
              ? const BoxDecoration(color: Colors.green, shape: BoxShape.circle)
              : const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
          child: Center(child: Text(toggle ? 'On' : "Off")),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('Start'),
        onPressed: () => onChangeAnimation(),
      ),
    );
  }
}
