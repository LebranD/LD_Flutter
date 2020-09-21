import 'package:first_flutter/utility/creator.dart';
import 'package:flutter/material.dart';

class AnimatedModalBarrierPage extends StatelessWidget {
  const AnimatedModalBarrierPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Modal Barrier')),
      body: Center(child: AnimatedModalBarrierView()),
    );
  }
}

class AnimatedModalBarrierView extends StatefulWidget {
  AnimatedModalBarrierView({Key key}) : super(key: key);

  @override
  _AnimatedModalBarrierViewState createState() => _AnimatedModalBarrierViewState();
}

class _AnimatedModalBarrierViewState extends State<AnimatedModalBarrierView> with SingleTickerProviderStateMixin {

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
    return Container(
      width: 200,
      height: 200,
      child: AnimatedModalBarrier(
        color: ColorTween(
          begin: Colors.red,
          end: Colors.orange
        ).animate(_controller),
      ),
    );
  }
}