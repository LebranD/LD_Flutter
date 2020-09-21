import 'package:flutter/material.dart';

class AnimatedDefaultTextStylePage extends StatelessWidget {
  const AnimatedDefaultTextStylePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedDefaultTextStylePage')),
      body: Center(child: AnimatedDefaultTextStyleView()),
    );
  }
}

class AnimatedDefaultTextStyleView extends StatefulWidget {
  AnimatedDefaultTextStyleView({Key key}) : super(key: key);

  @override
  _AnimatedDefaultTextStyleViewState createState() => _AnimatedDefaultTextStyleViewState();
}

class _AnimatedDefaultTextStyleViewState extends State<AnimatedDefaultTextStyleView> {
  bool isChangeStyle = true;

  @override
  void initState() { 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle styleOne = TextStyle(color: Colors.orange, fontSize: 14);
    final TextStyle styleTwo = TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold);
    return AnimatedDefaultTextStyle(
      child: GestureDetector(
        onTap: () {
          setState(() => isChangeStyle =! isChangeStyle);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('I would rather betray the whole world than leave them to betray me.'),
            Text('翻译: 宁我负人,休人负我' )
          ],
        ),
      ), 
      style: isChangeStyle ? styleTwo : styleOne,
      textAlign: TextAlign.center,
      duration: Duration(seconds: 1)
    );
  }
}