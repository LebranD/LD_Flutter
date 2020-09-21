import 'package:flutter/material.dart';

class PositionedTransitionPage extends StatelessWidget {
  const PositionedTransitionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Positioned Transition')),
      body: Center(child: PositionedTransitionView()),
    );
  }
}

class PositionedTransitionView extends StatefulWidget {
  PositionedTransitionView({Key key}) : super(key: key);

  @override
  _PositionedTransitionViewState createState() => _PositionedTransitionViewState();
}

class _PositionedTransitionViewState extends State<PositionedTransitionView> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<RelativeRect> animation;

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
    final double smallLogo = 100;
    final double largeLogo = 200;
    return LayoutBuilder(builder: (context, constraits) { // 获取父组件的约束尺寸
      final Size biggest = constraits.biggest;
      return Stack(
        children: [
          PositionedTransition(
            rect: RelativeRectTween(
              begin: RelativeRect.fromSize(Rect.fromLTWH(0, 0, smallLogo, smallLogo), biggest),
              end: RelativeRect.fromSize(Rect.fromLTWH(biggest.width - largeLogo, biggest.height - largeLogo, largeLogo, largeLogo), biggest)
            ).animate(CurvedAnimation(
              parent: _controller,
              curve: Curves.elasticInOut)), 
            child: Padding(padding: const EdgeInsets.all(8), child: FlutterLogo())
          )
        ],
      );
    });
  }
}