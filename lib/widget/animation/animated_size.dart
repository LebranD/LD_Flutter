
import 'package:first_flutter/utility/button.dart';
import 'package:flutter/material.dart';

class AnimatedSizePage extends StatelessWidget {
  const AnimatedSizePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Size')),
      body: Center(child: AnimatedSizeView()),
    );
  }
}

class AnimatedSizeView extends StatefulWidget {
  AnimatedSizeView({Key key}) : super(key: key);

  @override
  _AnimatedSizeViewState createState() => _AnimatedSizeViewState();
}

class _AnimatedSizeViewState extends State<AnimatedSizeView> with SingleTickerProviderStateMixin {

  bool isChangeSize = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Duration(seconds: 1), 
      vsync: this,
      child: Button(child: FlutterLogo(size: isChangeSize ? 100 : 200), onPressed: () => setState(() => isChangeSize =! isChangeSize)),
      curve: Curves.linear,
    );
  }
}