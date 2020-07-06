
import 'dart:ffi';

import 'package:first_flutter/utility/button.dart';
import 'package:first_flutter/utility/creator.dart';
import 'package:first_flutter/utility/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum StatusViewType {
  normal,
  loading,
  progressHud,
  failure,
  empty,
}

class StatusView extends StatelessWidget {

  final StatusViewType status;
  final WidgetBuilder builder;
  final WidgetBuilder emptyBuilder;
  final WidgetBuilder errorBuilder;
  final VoidCallback onTap;
  final String emptyTitle;

  StatusView({
    @required this.status,
    this.builder,
    this.emptyBuilder,
    this.errorBuilder,
    this.onTap,
    this.emptyTitle,
  });

  buildProgressHud() {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: 100,
          height: 100,
          alignment: Alignment.center,
          child: CupertinoActivityIndicator(radius: 12),
        ),
      ),
    );
  }

  buildLoading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(strokeWidth: 2.0, valueColor: AlwaysStoppedAnimation<Color>(Colors.orange)),
        SizedBox(height: 20),
        createText('加载中',style: TextStyle(fontSize: 16, color: Colors.grey)),
        SizedBox(height: 50,)
      ],
    );
  }

  buildEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('status_empty.png'),
        SizedBox(height: 10),
        createText(
          emptyTitle ?? '暂无内容',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 20)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (status == StatusViewType.normal) {
      return builder != null ? builder(context) : SizedBox();
    }
    if (status == StatusViewType.progressHud) {
      return Stack(
        children: <Widget>[
          builder != null ? builder(context) : SizedBox,
          buildProgressHud(),
        ],
      );
    }
    var contentView;
    switch (status) {
      case StatusViewType.loading:
        contentView = buildLoading();
        break;
      case StatusViewType.empty:
//        contentView =
        break;
      case StatusViewType.failure:
        break;
      default:
        contentView = SizedBox();
        break;
    }
    return Stack(
      children: <Widget>[
        Container(width: Screen.width, child: contentView,),
      ],
    );
  }
}