
import 'package:first_flutter/utility/button.dart';
import 'package:flutter/material.dart';

class AnimatedListStatePage extends StatelessWidget {
  
  AnimatedListStatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated List State')),
      body: Center(child: AnimatedListStateView()),
    );
  }
}

class AnimatedListStateView extends StatefulWidget {

  AnimatedListStateView({Key key}) : super(key: key);

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @override
  _AnimatedListStateViewState createState() => _AnimatedListStateViewState();
}

class _AnimatedListStateViewState extends State<AnimatedListStateView> {
  
  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: widget.listKey,
      itemBuilder: (context, index, animation) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Button(
            child: Text('第$index 项'), 
            onPressed: () {
              widget.listKey.currentState.insertItem(9, duration: Duration(seconds: 3));
            }
          ),
        );
      },
      initialItemCount: 10,
    );
  }
}