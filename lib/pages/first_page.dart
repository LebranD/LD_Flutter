import 'dart:async';
import 'dart:math';

import 'package:first_flutter/AppNavigator.dart';
import 'package:first_flutter/app/app.dart';
import 'package:first_flutter/app/app_model.dart';
import 'package:first_flutter/pages/second_page.dart';
import 'package:first_flutter/utility/button.dart';
import 'package:first_flutter/utility/creator.dart';
import 'package:first_flutter/widget/popup_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scoped_model/scoped_model.dart';
import './MixinTest.dart';

class FirstPage extends StatefulWidget with MixinTest {
  @override
  FirstPageState createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> with TickerProviderStateMixin {
  int _count = 0;
  String value = '';
  TabController _controller;
  List<String> _tabs = ['One', 'Two'];
  bool _ignore = false;

  @override
  void initState() { 
    super.initState();
    _controller = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() { 
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

  _buildSlideTestView() {
    Random rand = Random();
    Widget w =  IgnorePointer(
        ignoring: _ignore,
        child: GestureDetector(
          onTap: () {},
          dragStartBehavior: DragStartBehavior.start,
          onHorizontalDragUpdate: (DragUpdateDetails details) {
            if (details.delta.dx > 0.0) {
              setState(() {
                _ignore = true;
              });
            }
            print('update details.localPosition ==== ${details.localPosition} == ${details.delta} == ${details.primaryDelta}');
          },
          onHorizontalDragEnd: (DragEndDetails details) {
            setState(() {
              _ignore = false;
            });
          },
          child: Container(
            height: 50,
            color: Color.fromRGBO(rand.nextInt(255), rand.nextInt(255), rand.nextInt(255), 1),
            alignment: Alignment.center,
            child: createText('手势冲突测试', style: TextStyle(color: Colors.white)), 
          ), 
        ));
    return ListView.builder(
      itemBuilder: (context, index) => CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width, 
              color: Colors.orange,
              child: createText('手势冲突测试', style: TextStyle(color: Colors.white)),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.red,
              width: 40,
              child: createText('Delete'),
            ), 
          )
        ],
      ), 
      itemCount: 5, 
      itemExtent: 50,
    );
  }

  @override
  Widget build(BuildContext contexts) {
    List<Tab> tabs = _tabs.map((e) => Tab(text: e)).toList();
    return ScopedModelDescendant(builder: (context, child, AppModel model) {
      return Scaffold(
        appBar: createAppBar(context: context, title: 'Main'), 
        body: Column(
          children: <Widget>[
            TabBar(
              controller: _controller,
              tabs: tabs,  
              unselectedLabelColor: Colors.black87,
              labelColor: Colors.purple,
            ),
            Button(child: createText('click'), onPressed: () {
              showPopCenterView(context, child: Container(color: Colors.orange, width: 290, height: 400));
            }),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: <Widget>[
                  Container(color: Colors.green),
                  _buildSlideTestView()
                ], 
              ),
            ),
          ], 
        ),
      );
    });
  }
}
