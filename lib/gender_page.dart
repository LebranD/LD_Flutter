import 'dart:async';

import 'package:first_flutter/my_account/account_page.dart';
import 'package:first_flutter/utility/hilight_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenderChoose extends StatefulWidget {
  GenderChoose();
  @override
  _GenderChooseState createState() => new _GenderChooseState();
}

class _GenderChooseState extends State {
  bool _showDialog = false;
  int _selectGender = 0; 

  chooseGender(int gender) {
    setState(() {
      _showDialog =! _showDialog;
      _selectGender = gender;
    });
  }

  Future test() async {
    Future f = new Future(() => {

    });

    Timer(Duration(seconds: 1), () {
      f.then((_) => print('123'));
    });

    return await f;
  }

  test1() async {
    var text = await test();

    print('666 ===== $text');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Text(
                  '请告诉我您的性别',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  '性别区分，锁定专属内容',
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    HilightButton(
                      child: Text('男生'),
                      onPressed: () => chooseGender(0),
                      normalImg: Image.asset('img/common/gender_choose_male_n.png'),
                      hilightImg: Image.asset('img/common/gender_choose_male.png'),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    HilightButton(
                      child: Text('女生'),
                      onPressed: () => chooseGender(1),
                      normalImg: Image.asset('img/common/gender_choose_female_n.png'),
                      hilightImg: Image.asset('img/common/gender_choose_female.png'),
                    )
                  ],
                ),
                SizedBox(height: 50,),
                RaisedButton(
                  key: Key('123'),
                  child: Text('跳过'),
                  onPressed: () {
                    test1();
//                    Navigator.push(
//                      context,
//                      CupertinoPageRoute(
//                        settings: RouteSettings(
//                          name: 'what?',
//                        ),
//                        builder: (BuildContext context) => MyAccountPage()
//                      )
//                    );
                  },
                ),
              ],
            ),
          ),
        ),
        _showDialog
            ? Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: AlertDialog(
                  title: Text('幸运弹弹弹'),
                  content: Text('您选择了${_selectGender == 0 ? '男性' : '女性'}'),
                ),
              )
            : SizedBox(height: 0,)
      ],
    ));
  }
}
