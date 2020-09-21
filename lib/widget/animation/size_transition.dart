
import 'package:flutter/material.dart';

class SizeTransitionPage extends StatelessWidget {
  const SizeTransitionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Size Transition')),
      body: Center(child: SizeTransitionView()),
    );
  }
}

class SizeTransitionView extends StatefulWidget {
  SizeTransitionView({Key key}) : super(key: key);

  @override
  _SizeTransitionViewState createState() => _SizeTransitionViewState();
}

class _SizeTransitionViewState extends State<SizeTransitionView> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() { 
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 3))..repeat();
  }

  @override
  void dispose() { 
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut)),
      axisAlignment: 0.0,
      child: FlutterLogo(size: 100),
    );
  }
}