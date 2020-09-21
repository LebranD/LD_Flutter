
import 'package:flutter/material.dart';

class SlideTransitionPage extends StatelessWidget {
  const SlideTransitionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slide Transition')),
      body: Center(child: SlideTransitionView()),
    );
  }
}

class SlideTransitionView extends StatefulWidget {
  SlideTransitionView({Key key}) : super(key: key);

  @override
  _SlideTransitionViewState createState() => _SlideTransitionViewState();
}

class _SlideTransitionViewState extends State<SlideTransitionView> with SingleTickerProviderStateMixin {

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
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(-1.5, 0), end: const Offset(1.5, 0.0)).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticInOut)),
      child: FlutterLogo(size: 100),
    );
  }
}