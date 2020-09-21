
import 'package:first_flutter/utility/button.dart';
import 'package:flutter/material.dart';


class AnimatedPositionedPage extends StatelessWidget {
  const AnimatedPositionedPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Positioned')),
      body: Center(child: AnimatedPositionedView()),
    );
  }
}

class AnimatedPositionedView extends StatefulWidget {
  AnimatedPositionedView({Key key}) : super(key: key);

  @override
  _AnimatedPhyscialModelViewState createState() => _AnimatedPhyscialModelViewState();
}

class _AnimatedPhyscialModelViewState extends State<AnimatedPositionedView> {

  bool isChangePosition = true;

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        AnimatedPositioned(
          left: 10,
          right: isChangePosition ? 30 : 100,
          height: isChangePosition ? 30 : 100,
          child: Container(
            color: Colors.blueAccent,
            child: Button(
              child: Text('Click Me'), 
              onPressed: () {
                setState(() => isChangePosition =! isChangePosition);
              }
            ),
          ),
          duration: Duration(seconds: 1)
        )
      ],
    );
  }
}