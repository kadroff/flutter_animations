import 'package:flutter/material.dart';

const _duration = Duration(milliseconds: 300);
const _maxSize = 24.0;
const _minSize = 10.0;

class LikeAnimation extends StatefulWidget {
  const LikeAnimation({super.key});

  @override
  State<LikeAnimation> createState() => _LikeAnimationState();
}

class _LikeAnimationState extends State<LikeAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: _duration,
      lowerBound: _minSize,
      upperBound: _maxSize,
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedCrossFade example'),
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) => GestureDetector(
            child: SizedBox(
              height: _controller.value,
              child: const Icon(
                Icons.heart_broken,
                color: Colors.red,
                size: 100,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'start',
            onPressed: () => _controller.repeat(reverse: true),
            child: const Text('Start'),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            heroTag: "stop",
            onPressed: () => _controller.stop(),
            child: const Text('Stop'),
          ),
        ],
      ),
    );
  }
}
