import 'package:flutter/material.dart';

enum TapButtonState {
  normal,
  hilight,
  selected,
  disabled,
}

class HilightButton extends StatefulWidget{
  final VoidCallback onPressed;
  final Widget child;
  final Image normalImg;
  final Image hilightImg;
  final Image selectImg;
  final Image disabledImg;

  HilightButton({
    @required this.child,
    @required this.onPressed,
    this.normalImg,
    this.selectImg,
    this.hilightImg,
    this.disabledImg,
  });

  _HilightButtonState createState() => new _HilightButtonState();
}

class _HilightButtonState extends State <HilightButton> {
  TapButtonState tapState = TapButtonState.normal;
  _onTapDown() {
    setState(() {
      tapState = TapButtonState.hilight;
    });
  }

  _onTapup() {
    setState(() {
      tapState = TapButtonState.normal;
    });
  }

  _onTap() {
    if (widget.onPressed != null) {
      widget.onPressed();
    } 
  }

  Image get stateImg {
    Image img;
    switch (tapState) {
      case TapButtonState.normal:
        img = widget.normalImg;
        break;
      case TapButtonState.selected:
        img = widget.selectImg;
        break;
      case TapButtonState.hilight:
        img = widget.hilightImg;
        break;
      case TapButtonState.disabled:
        img = widget.disabledImg;
        break;
      default:
    }
    return img;
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTapDown: (details) => _onTapDown(),
        onTapUp: (details) => _onTapup(),
        onTap: () => _onTap(),
        child: this.stateImg,
      ),
    );
  }
}