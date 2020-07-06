import 'dart:async';

import 'package:first_flutter/AppNavigator.dart';
import 'package:first_flutter/app/app.dart';
import 'package:first_flutter/app/app_model.dart';
import 'package:first_flutter/pages/second_page.dart';
import 'package:first_flutter/utility/button.dart';
import 'package:first_flutter/utility/creator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './MixinTest.dart';

class FirstPage extends StatefulWidget with MixinTest {
  @override
  FirstPageState createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  int _count = 0;
  String value = '';
  StreamController _controller;
  Stream _stream;
  Stream _eventStream;
  StreamSink _sink;

  @override
  void initState() { 
    super.initState();
    _controller = StreamController(
      onListen: () {

      },
      onCancel: () {

      },
      onPause: () {
        
      },
      onResume: () {

      },
    );
    _stream = _controller.stream;
    _sink = _controller.sink;
  }

  @override
  void dispose() { 
    _controller.close();
    super.dispose();
  }

  Future<String> func() async {
    Completer<String> completer = Completer();

    Timer(Duration(seconds: 3), () {
      completer.completeError('~ ^ ~');
    });

    return completer.future;
  }

  futureTrigger(BuildContext context) async {
    func().then((v) {}).catchError((e) {});
    setState(() {});
  }

  @override
  Widget build(BuildContext contexts) {
    return ScopedModelDescendant(builder: (context, child, AppModel model) {
      return Scaffold(
          drawerEdgeDragWidth: 50,
          drawerScrimColor: Colors.orange,
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                  ),
                  duration: Duration(seconds: 3),
                  child: Center(
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                        child: Text('L'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.lightBlue,
          body: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  width: 150,
                  height: 100,
                  child: Builder(builder: (BuildContext context) => Column(
                    children: <Widget>[
                      Button(
                          child: createText('按就完事了'),
                          onPressed: () {
                            AppNavigator.push(context, SecondPage());
                          }),
                    ],
                  )),
                ),
              ),
              value.length != 0
                  ? AlertDialog(
                      title: createText(value,
                          style: TextStyle(fontSize: 15, color: Colors.red)))
                  : Container(),
            ],
          ));
    });
  }
}
