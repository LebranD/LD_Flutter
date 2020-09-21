
import 'dart:ui';

import 'package:flutter/material.dart';

class DecoratedBoxPage extends StatelessWidget {
  const DecoratedBoxPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DecoratedBoxTransition'),),
      body: Center(
        child: DecoratedBoxView(),
      ),
    );
  }
}

class DecoratedBoxView extends StatefulWidget {
  DecoratedBoxView({Key key}) : super(key: key);

  @override
  _DecoratedBoxViewState createState() => _DecoratedBoxViewState();
}

class _DecoratedBoxViewState extends State<DecoratedBoxView> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<Decoration> animation;
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 3))..repeat();
    BoxDecoration begin = BoxDecoration(
      borderRadius: BorderRadius.circular(0), 
      boxShadow: [BoxShadow(offset: Offset(0, 3)), BoxShadow(offset: Offset(3, 0))]
    );
    BoxDecoration end = BoxDecoration(
      borderRadius:  BorderRadius.circular(30),
      boxShadow: [BoxShadow(offset: Offset(0, -3))]
    );
    animation = DecorationTween(begin: begin, end: end).animate(_controller);
    super.initState();
  }

  @override
  void dispose() { 
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return DecoratedBoxTransition(
      key: widget.key,
      decoration: animation,
      child: Image.asset('img/common/gender_choose_male.png'),
    );
  }
}