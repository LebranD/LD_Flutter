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
import 'package:first_flutter/widget/popup_view.dart';
import 'package:flutter/material.dart';

class AppPage extends StatefulWidget {
  AppPage({Key key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Builder(
          builder: (BuildContext context) => Center(
                child: Button(
                    child: createText('点击'),
                    onPressed: () {
                      // showPopCenterView(context, child: Container(color: Colors.orange, width: 290, height: 400));
                      // AppNavigator.push(context, HeroPage());
                      // AppNavigator.push(context, DecoratedBoxPage());
                      // AppNavigator.push(context, FadeTransitionPage());
                      // AppNavigator.push(context, PositionedTransitionPage());
                      // AppNavigator.push(context, RotationTransitionPage());
                      // AppNavigator.push(context, ScaleTransitionPage());
                      // AppNavigator.push(context, SizeTransitionPage());
                      // AppNavigator.push(context, SlideTransitionPage());
                      // AppNavigator.push(context, AnimatedDefaultTextStylePage());
                      // AppNavigator.push(context, AnimatedListStatePage());
                      // AppNavigator.push(context, AnimatedModalBarrierPage());
                      // AppNavigator.push(context, AnimatedOpacityPage());
                      // AppNavigator.push(context, AnimatedPositionedPage());
                      // AppNavigator.push(context, AnimatedSizePage());
                      AppNavigator.push(context, AnimatedWidgetPage());
                    }),
              )),
    ));
  }
}
