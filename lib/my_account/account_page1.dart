import 'dart:ui';

import 'package:first_flutter/my_account/account_record_cell.dart';
import 'package:first_flutter/my_account/account_wealth_cell.dart';
import 'package:first_flutter/utility/creator.dart';
import 'package:first_flutter/utility/screen.dart';
import 'package:flutter/material.dart';

class MyAccountPage extends StatefulWidget {
  MyAccountPage();

  _MyAccountPageState createState() => new _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {

  _buildAppBar() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      height: Screen.navigationBarHeight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 44,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 30,
                    child: GestureDetector(
                      child: Image.asset('img/common/back_btn_white.png'),
                      onTap: () {

                      },
                    ),
                  ),
                  createText('我的资产',style: TextStyle(fontSize: 18, color: Color(0xFFFFFFFF))),
                  GestureDetector(
                    child: createText('充值明细',style: TextStyle(fontSize: 18, color: Color(0xFFFFFFFF))),
                    onTap: () {

                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildBottomButton() {
    double _bottomSafeHeight = Screen.bottomSafeHeight;
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        height: _bottomSafeHeight + 50,
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              child: GestureDetector(
                onTap: () {},
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFFFFB964), Color(0xFFFF9212)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: createText('储值',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  _buildContent() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.fromLTRB(15, Screen.navigationBarHeight+15, 15, 15),
          sliver: SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              AccountWealthCell(),
              SizedBox(height: 20),
              AccountWealthCell(),
              SizedBox(height: 20),
              AccountWealthCell(),
            ]),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        colors: <Color>[Color(0xFFFF9212), Color(0x00FF9212)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                    ),
                  ),
                  _buildContent(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  AccountRecordCell('我的书券', '325 + 1198'),
                  AccountRecordCell('消费记录', ''),
                ],
              ),
            ),
            _buildBottomButton(),
          ],
        ),
        _buildAppBar(),
      ],
    ));
  }
}
