import 'package:first_flutter/super_vip/super_vip_normal_view.dart';
import 'package:first_flutter/utility/button.dart';
import 'package:flutter/material.dart';
import '../utility/creator.dart';


class SuperVipPage extends StatefulWidget {
  SuperVipPage();

  @override
  _SuperVipState createState() => _SuperVipState();
}

class _SuperVipState extends State<SuperVipPage> {

  _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(187.0+24.0),
      child: AppBar(
        title: Text.rich(
          createTextSpan(
            children: <TextSpan>[
              createTextSpan(
                text: '您当前为:',
                style: TextStyle(
                  fontSize: 14, 
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              createTextSpan(
                text: '普通会员',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                )
              )
            ]
          )
        ),
        elevation: 0,
        centerTitle: false,
        brightness: Brightness.dark,
        leading: Button(
          onPressed: () {
            Navigator.pop(context);
          },
          child: 
            Image.asset('img/common/back_btn_white.png'),
        ),
        flexibleSpace: SuperVipNormalView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
    );
  }
}