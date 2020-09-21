
import 'package:flutter/material.dart';

class FadeTransitionPage extends StatelessWidget {
  const FadeTransitionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FadeTransition')),
      body: Center(child: FadeTransitionView()),
    );
  }
}

class FadeTransitionView extends StatefulWidget {
  FadeTransitionView({Key key}) : super(key: key);

  @override
  _FadeTransitionViewState createState() => _FadeTransitionViewState();
}

class _FadeTransitionViewState extends State<FadeTransitionView> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<double> animation;

  @override
  void initState() { 
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 3))..repeat();
    animation = Tween(begin: 1.0, end: 0.01).animate(_controller);
  }

  @override
  void dispose() { 
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Container(color: Colors.orange, width: 100, height: 100),
    );
  }
}