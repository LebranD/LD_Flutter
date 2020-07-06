import 'package:first_flutter/app/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, AppModel model) => (
        Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                leading: Icon(Icons.arrow_back_ios),
                title: Text('伸缩头部'),
                actions: <Widget>[
                  IconButton(icon: Icon(Icons.android), onPressed: (){}),
                  IconButton(icon: Icon(Icons.print), onPressed: (){}),
                ],
                backgroundColor: Theme.of(context).accentColor,
                expandedHeight: 200.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network('http://k.zol-img.com.cn/sjbbs/7692/a7691515_s.jpg', fit: BoxFit.cover),
                ),
                floating: true,
                snap: false,
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                }),
              ),
            ],
          ),
        )
      ),
    );
  }
}