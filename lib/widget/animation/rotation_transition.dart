
import 'dart:math' as math;
import 'package:flutter/material.dart';

class RotationTransitionPage extends StatelessWidget {
  const RotationTransitionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rotation Page')),
      body: Center(child: RotationTransitionView()),
    );
  }
}

class RotationTransitionView extends StatefulWidget {
  RotationTransitionView({Key key}) : super(key: key);

  @override
  _RotationTransitionViewState createState() => _RotationTransitionViewState();
}

class _RotationTransitionViewState extends State<RotationTransitionView> with SingleTickerProviderStateMixin {

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
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 2 * math.pi).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInBack)),
      child: FlutterLogo(size: 100),
    );
  }
}