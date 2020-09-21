import 'package:flutter/material.dart';

class ScaleTransitionPage extends StatelessWidget {
  const ScaleTransitionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scale Transition'),
      ),
      body: Center(child: ScaleTransitionView()),
    );
  }
}

class ScaleTransitionView extends StatefulWidget {
  ScaleTransitionView({Key key}) : super(key: key);

  @override
  _ScaleTransitionViewState createState() => _ScaleTransitionViewState();
}

class _ScaleTransitionViewState extends State<ScaleTransitionView> with SingleTickerProviderStateMixin {

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
    return ScaleTransition(
      scale: Tween(begin: 1.0, end: 1.5).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticInOut)),
      child: FlutterLogo(size: 100),
    );
  }
}