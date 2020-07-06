import 'package:first_flutter/utility/creator.dart';
import 'package:flutter/material.dart';

class AccountRecordCell extends StatefulWidget {
  final String title;
  final String detail;

  AccountRecordCell(
    this.title,
    this.detail,
  );

  _AccountRecordCellState createState() => new _AccountRecordCellState();
}

class _AccountRecordCellState extends State<AccountRecordCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        child: GestureDetector(
          onTap: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: createText(widget.title,
                    style: TextStyle(fontSize: 16, color: Color(0xFF333333))),
              ),
              Row(
                children: <Widget>[
                  createText(widget.detail,
                      style: TextStyle(fontSize: 16, color: Color(0xFFFF7900))),
                  SizedBox(width: 10),
                  Image.asset('img/common/arrow_right.png'),
                ],
              ),
            ],
          ),
        ));
  }
}
