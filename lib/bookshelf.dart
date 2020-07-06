import 'package:flutter/material.dart';
import 'package:first_flutter/AppNavigator.dart';

class Bookshelf extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BookshelfState();
  }
}

class BookshelfState extends State {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Container(
        child: new Center(
          child: new Text('哦，牛逼'),
        ),
      ),
    );
  }
}