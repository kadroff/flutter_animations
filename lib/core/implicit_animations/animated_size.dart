import 'package:flutter/material.dart';

class AnimatedSizeWidget extends StatefulWidget {
  const AnimatedSizeWidget({super.key});

  @override
  State<AnimatedSizeWidget> createState() => _AnimatedSizeWidgetState();
}

class _AnimatedSizeWidgetState extends State<AnimatedSizeWidget> {
  bool _toogle = false;
  double _initialSize = 100;

  void _updateSize() {
    setState(() {
      _initialSize = _toogle ? 250.0 : 100.0;
      _toogle = !_toogle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated size example'),
      ),
      body: GestureDetector(
        onTap: () {
          _updateSize();
        },
        child: AnimatedSize(
          duration: const Duration(seconds: 1),
          child: Center(
            child: FlutterLogo(
              size: _initialSize,
            ),
          ),
        ),
      ),
    );
  }
}
