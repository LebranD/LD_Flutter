import 'package:first_flutter/utility/creator.dart';
import 'package:flutter/material.dart';

class AccountWealthCell extends StatefulWidget {
  AccountWealthCell();

  _AccountWealthCellState createState() => new _AccountWealthCellState();
}

class _AccountWealthCellState extends State<AccountWealthCell> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Image.asset(
            'img/common/account_item_bg.png',
            fit: BoxFit.fill,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          height: 120,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    createText('书币余额',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFF333333))),
                    SizedBox(
                      height: 2,
                    ),
                    createText('1560',
                        style:
                            TextStyle(fontSize: 36, color: Color(0xFFFF9212))),
                  ],
                ),
              ),
              Image.asset(
                'img/common/account_coin.png',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
