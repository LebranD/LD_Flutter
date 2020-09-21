
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedWidgetPage extends StatelessWidget {
  const AnimatedWidgetPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Widget')),
      body: Center(child: AnimatedWidgetView()),
    );
  }
}

class SpiningAnimatedWidget extends AnimatedWidget {

  const SpiningAnimatedWidget({Key key, AnimationController controller}) 
  : super(key: key, listenable: controller);
  
  Animation<double> get _progress => listenable;

  @override
  Widget build(BuildContext context) {
    print('_progress.value == ${_progress.value}');
    return Transform.rotate(
      angle: _progress.value * 2 * math.pi,
      child: Container(width: 200.0, height: 200.0, color: Colors.green),
    );
  }
}

class AnimatedWidgetView extends StatefulWidget {
  AnimatedWidgetView({Key key}) : super(key: key);

  @override
  _AnimatedWidgetViewState createState() => _AnimatedWidgetViewState();
}

class _AnimatedWidgetViewState extends State<AnimatedWidgetView> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() { 
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1))..repeat();
  }

  @override
  void dispose() { 
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SpiningAnimatedWidget(controller: _controller);
  }
}