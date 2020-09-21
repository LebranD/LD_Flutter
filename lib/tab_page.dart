
import 'package:first_flutter/app/app_model.dart';
import 'package:first_flutter/pages/first_page.dart';
import 'package:first_flutter/pages/second_page.dart';
import 'package:first_flutter/utility/creator.dart';
import 'package:first_flutter/widget/animation/animation_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class TabPage extends StatefulWidget {

  _TabPageState createState() => _TabPageState();

}

class _TabPageState extends State<TabPage> {

  AppModel _model;

  List<BottomNavigationBarItem> buildTabBars() {
    List<BottomNavigationBarItem> tabbars = [];
    tabbars.add(BottomNavigationBarItem(
      icon: Icon(Icons.accessibility),
      activeIcon: Icon(Icons.accessibility_new),
      title: createText('首页', style: TextStyle(fontSize: 14, color: Colors.orange)),
    ));
    tabbars.add(BottomNavigationBarItem(
      icon: Icon(Icons.accessible),
      activeIcon: Icon(Icons.accessible_forward),
      title: createText('第二页', style: TextStyle(fontSize: 14, color: Colors.green)),
    ));
    tabbars.add(BottomNavigationBarItem(
      icon: Icon(Icons.bookmark_border),
      activeIcon: Icon(Icons.bookmark),
      title: createText('动画', style: TextStyle(fontSize: 14, color: Colors.green)),
    ));
    return tabbars;
  }

  @override
  void initState() {
    super.initState();
    _model = AppModel();
    setup();
  }

  setup() async {
    _model.setup();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return ScopedModel<AppModel>(
        model: _model,
        child: Stack(
          children: <Widget>[
            CupertinoTabScaffold(
              tabBar: CupertinoTabBar(
                items: buildTabBars(),
              ),
              tabBuilder: (BuildContext context, int index) {
                switch (index) {
                  case 0:
                    return FirstPage();
                  case 1:
                    return SecondPage();
                  case 2:
                    return AnimationInterfacePage();
                  default:
                    return null;
                }
              },
            )
          ],
        ),
    );
  }

}