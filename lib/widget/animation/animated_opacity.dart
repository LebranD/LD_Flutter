
import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatelessWidget {
  const AnimatedOpacityPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Opacity')),
      body: Center(child: AnimatedOpacityView()),
    );
  }
}

class AnimatedOpacityView extends StatefulWidget {
  AnimatedOpacityView({Key key}) : super(key: key);

  @override
  _AnimatedOpacityViewState createState() => _AnimatedOpacityViewState();
}

class _AnimatedOpacityViewState extends State<AnimatedOpacityView> {

  double opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: opacity, 
            duration: Duration(seconds: 1),
            child: FlutterLogo(size: 100),
          ),
          Slider(value: opacity, onChanged: (value) => setState(() => opacity = value), max: 1.0, min: 0.0),
        ],
      );
  }
}