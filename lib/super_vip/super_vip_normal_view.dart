import 'package:first_flutter/super_vip/super_vip_product_cell.dart';
import 'package:first_flutter/utility/screen.dart';
import 'package:flutter/material.dart';

class SuperVipNormalView extends StatefulWidget {
  
  _SuperVipNormalState createState() => new _SuperVipNormalState();
} 

class _SuperVipNormalState extends State <SuperVipNormalView> {
  @override
  Widget build(BuildContext context) {

    double itemW = (Screen.width-60) / 4.0;
    double itemH = 117 / 81.0 * itemW;
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Image.asset('img/common/vip_header_bg.png' , fit: BoxFit.fill),
          ),
          Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: itemH,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10,),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) => (
                        SuperVipProductCell(
                          itemW: itemW,
                          itemH: itemH,
                        )
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset('img/common/vip_header_arc_bg.png', fit: BoxFit.fill),
          )
        ],
      ),
    );
  }
}