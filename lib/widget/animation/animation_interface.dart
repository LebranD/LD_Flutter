
import 'package:first_flutter/AppNavigator.dart';
import 'package:first_flutter/utility/button.dart';
import 'package:first_flutter/utility/creator.dart';
import 'package:first_flutter/widget/animation/animated_default_text_style.dart';
import 'package:first_flutter/widget/animation/animated_list_state.dart';
import 'package:first_flutter/widget/animation/animated_modal_barrier.dart';
import 'package:first_flutter/widget/animation/animated_opacity.dart';
import 'package:first_flutter/widget/animation/animated_positioned.dart';
import 'package:first_flutter/widget/animation/animated_size.dart';
import 'package:first_flutter/widget/animation/animated_widget.dart';
import 'package:first_flutter/widget/animation/decorated_box_transition.dart';
import 'package:first_flutter/widget/animation/fade_transition.dart';
import 'package:first_flutter/widget/animation/hero.dart';
import 'package:first_flutter/widget/animation/positioned_transition.dart';
import 'package:first_flutter/widget/animation/rotation_transition.dart';
import 'package:first_flutter/widget/animation/scale_transition.dart';
import 'package:first_flutter/widget/animation/size_transition.dart';
import 'package:first_flutter/widget/animation/slide_transition.dart';
import 'package:flutter/material.dart';

// 文档地址: https://flutterchina.club/widgets/animation/

enum AnimationPageType {
  animatedDefaultTextStylePage,
  animatedListStatePage,
  animatedModalBarrierPage,
  animatedOpacityPage,
  animatedPositionedPage,
  animatedSizePage,
  animatedWidgetPage,
  decoratedBoxPage,
  fadeTransitionPage,
  heroPage,
  positionedTransitionPage,
  rotationTransitionPage,
  scaleTransitionPage,
  sizeTransitionPage,
  slideTransitionPage,
}

class AnimationInterfacePage extends StatelessWidget {

  AnimationInterfacePage({Key key}) : super(key: key);
  
  push(BuildContext context, AnimationPageType type) {
    switch (type) {
      case AnimationPageType.animatedDefaultTextStylePage:
        AppNavigator.push(context, AnimatedDefaultTextStylePage());
        break;
      case AnimationPageType.animatedListStatePage:
        AppNavigator.push(context, AnimatedListStatePage());
        break;
      case AnimationPageType.animatedModalBarrierPage:
        AppNavigator.push(context, AnimatedModalBarrierPage());
        break;
      case AnimationPageType.animatedOpacityPage:
        AppNavigator.push(context, AnimatedOpacityPage());
        break;
      case AnimationPageType.animatedPositionedPage:
        AppNavigator.push(context, AnimatedPositionedPage());
        break;
      case AnimationPageType.animatedSizePage:
        AppNavigator.push(context, AnimatedSizePage());
        break;
      case AnimationPageType.animatedWidgetPage:
        AppNavigator.push(context, AnimatedWidgetPage());
        break;
      case AnimationPageType.decoratedBoxPage:
        AppNavigator.push(context, DecoratedBoxPage());
        break;
      case AnimationPageType.fadeTransitionPage:
        AppNavigator.push(context, FadeTransitionPage());
        break;
      case AnimationPageType.heroPage:
        AppNavigator.push(context, HeroPage());
        break;
      case AnimationPageType.decoratedBoxPage:
        AppNavigator.push(context, DecoratedBoxPage());
        break;
      case AnimationPageType.positionedTransitionPage:
        AppNavigator.push(context, PositionedTransitionPage());
        break;
      case AnimationPageType.scaleTransitionPage:
        AppNavigator.push(context, ScaleTransitionPage());
        break;                                                                                                                                                          
      case AnimationPageType.sizeTransitionPage:
        AppNavigator.push(context, SizeTransitionPage());
        break;
      case AnimationPageType.slideTransitionPage:
        AppNavigator.push(context, SlideTransitionPage());
        break;
      case AnimationPageType.rotationTransitionPage:
        AppNavigator.push(context, RotationTransitionPage());
        break;         
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: createText('Animation动画组件集合')),
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        itemBuilder: (context, index) {
          return Button(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                createText(AnimationPageType.values[index].toString().replaceAll('AnimationPageType.', '')),
                Icon(Icons.arrow_forward_ios),
              ],
            ), 
            onPressed: () => push(context, AnimationPageType.values[index])
          );
        },
        itemExtent: 50,
        itemCount: AnimationPageType.values.length,
      ),
    );
  }
}