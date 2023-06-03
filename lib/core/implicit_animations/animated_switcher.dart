import 'package:flutter/material.dart';

class AnimatedSwitcherWidget extends StatefulWidget {
  const AnimatedSwitcherWidget({super.key});

  @override
  State<AnimatedSwitcherWidget> createState() => _AnimatedSwitcherWidgetState();
}

class _AnimatedSwitcherWidgetState extends State<AnimatedSwitcherWidget> {
  bool isLoading = false;

  void onChangeAnimation() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    const newsWidget = Card(
      key: ValueKey('newsWidget'),
      child: ListTile(
        title: Text('Заголовок'),
        subtitle: Text('Подзаголовок'),
        trailing: Icon(
          Icons.arrow_right,
          size: 32,
        ),
      ),
    );
    final shimmerWidget = Card(
      key: const ValueKey('shimmerKey'),
      child: ListTile(
        title: Container(
          height: 20,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
        ),
        subtitle: Container(
          height: 10,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedSwitcher example'),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(seconds: 3),
            child: isLoading ? shimmerWidget : newsWidget,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('Start'),
        onPressed: () => onChangeAnimation(),
      ),
    );
  }
}
