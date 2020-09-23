import 'package:first_flutter/utility/button.dart';
import 'package:flutter/material.dart';

Future showPopCenterView(BuildContext context, {
  Widget child,
  bool showCloseBtn = true,
  bool barrierDismissible = true,
  Color barrierColor,
  Duration transitionDuration = const Duration(milliseconds: 0),
}) async {
  showGeneralDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.1),
    pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
      return child;
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: '',
    transitionDuration: transitionDuration,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return PopupScaleTransition(child: child, showCloseBtn: showCloseBtn);
    },
  );
}

enum PopupAnimationState {
  none,
  spread,
  close,
}

class PopupScaleTransition extends StatefulWidget {

  final Widget child;
  final bool showCloseBtn;

  PopupScaleTransition({
    Key key,
    this.child,
    this.showCloseBtn = true,
  }) : super(key: key);

  @override
  _PopupScaleTransitionState createState() => _PopupScaleTransitionState();
}

class _PopupScaleTransitionState extends State<PopupScaleTransition> with TickerProviderStateMixin {

  AnimationController controller;
  AnimationController closeController;
  Animation<double> scaleAnimation;
  Animation<double> closeAnimation;
  Animation<double> opacityAnimation;
  PopupAnimationState animationState = PopupAnimationState.none;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    closeController = AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    scaleAnimation = Tween(begin: 0.7, end: 1.0).animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut));
    
    closeAnimation = Tween(begin: 1.1, end: 0.001).animate(closeController)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
      }
    });

    opacityAnimation = Tween(begin: 1.0, end: 0.0).animate(closeController);

    startAnimate();
    super.initState();
  }

  @override
  void dispose() { 
    controller.dispose();
    closeController.dispose();
    super.dispose();
  }

  startAnimate() {
    animationState = PopupAnimationState.spread;
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    Animation scaleAnim = animationState == PopupAnimationState.close ? closeAnimation : scaleAnimation;
    return Material(
      color: Colors.transparent,
      child: FadeTransition(
        opacity: opacityAnimation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScaleTransition(scale: scaleAnim, child: widget.child),
            if (widget.showCloseBtn)
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Button(
                  child: Icon(Icons.close), 
                  onPressed: () {
                    setState(() => animationState = PopupAnimationState.close);
                    closeController.forward();
                  }
                ),
              )
          ],
        ),
      )
    );
  }
}