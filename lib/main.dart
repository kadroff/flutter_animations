import 'package:flutter/material.dart';
import 'package:lesson_10/core/explicit_animations/like_animation.dart';
import 'package:lesson_10/core/implicit_animations/animated_container.dart';
import 'package:lesson_10/core/implicit_animations/animated_crossfade.dart';
import 'package:lesson_10/core/implicit_animations/animated_switcher.dart';
import 'package:lesson_10/core/navigation_animation/navigation_animation.dart';

final List pages = [
  {
    'title': 'AnimatedContainerWidget',
    'page': const AnimatedContainerWidget(),
    'isNavigationAnimation': false,
  },
  {
    'title': 'AnimatedSwitcherWidget',
    'page': const AnimatedSwitcherWidget(),
    'isNavigationAnimation': false,
  },
  {
    'title': 'AnimatedCrossFadeWidget',
    'page': const AnimatedCrossFadeWidget(),
    'isNavigationAnimation': false,
  },
  {
    'title': 'LikeAnimation',
    'page': const LikeAnimation(),
    'isNavigationAnimation': false,
  },
  {
    'title': 'Navigation animation',
    'isNavigationAnimation': true,
  },
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter animations'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Widget _animatedContainer = const AnimatedContainerWidget();
  final Widget _animatedSwitcher = const AnimatedSwitcherWidget();
  final Widget _animatedCrossFade = const AnimatedCrossFadeWidget();
  final Widget _animatedLike = const LikeAnimation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: pages.length,
              itemBuilder: (context, index) {
                final page = pages[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    onTap: () {
                      if (!page['isNavigationAnimation']) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => page['page'],
                          ),
                        );
                      }

                      if (page['isNavigationAnimation']) {
                        Navigator.of(context).push(_createRoute());
                      }
                    },
                    title: Text(page['title']),
                    trailing: const Icon(
                      Icons.arrow_right,
                      size: 32,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const NavigationAnimation(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.5);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
