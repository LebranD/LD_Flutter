import 'package:first_flutter/utility/creator.dart';
import 'package:flutter/material.dart';

class SuperVipProductCell extends StatefulWidget {
  final double itemW;
  final double itemH;

  SuperVipProductCell({this.itemW, this.itemH});

  _SuperVipProductCellState createState() => new _SuperVipProductCellState();
}

class _SuperVipProductCellState extends State<SuperVipProductCell>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  CurvedAnimation curve;

  _buildChild() {
    return Container(
      width: widget.itemW,
      height: widget.itemH,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset('img/common/super_vip_product_bg.png',
                fit: BoxFit.fill),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('90天',
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 14,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Color(0xFF999999),
                    decorationStyle: TextDecorationStyle.solid,
                  )),
              SizedBox(height: 5),
              Text.rich(createTextSpan(
                children: <TextSpan>[
                  createTextSpan(
                    text: '\$',
                    style: TextStyle(
                      color: Color(0xFF44535A),
                      fontSize: 14,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                  ),
                  createTextSpan(
                      text: '70',
                      style: TextStyle(
                        color: Color(0xFF44535A),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        textBaseline: TextBaseline.alphabetic,
                      ))
                ],
              )),
              Container()
            ],
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    curve = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -15.0 * curve.value),
      child: _buildChild(),
    );
  }
}
