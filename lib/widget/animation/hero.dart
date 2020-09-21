
import 'package:first_flutter/AppNavigator.dart';
import 'package:flutter/material.dart';

class HeroPage extends StatelessWidget {
  const HeroPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero Page')),
      body: Hero(
        tag: 'hero', 
        child:  Center(
          child: GestureDetector(
            onTap: () {
              AppNavigator.push(context, HeroDetailPage());
            },
            child: Image.asset('img/common/gender_choose_male.png'),
          ),
        ),
        transitionOnUserGestures: true,
        // 动画触发过程中的效果
        // flightShuttleBuilder: (flightContext, animation, direction,
        //     fromContext, toContext) {
        //   return Icon(Icons.recent_actors, size: 150.0,);
        // }, 
      ),
    );
  }
}

class HeroDetailPage extends StatelessWidget {
  const HeroDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SuperHero'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Hero(tag: 'hero', child: Image.asset('img/common/gender_choose_female.png'), transitionOnUserGestures: true,)),
          Expanded(child: Text('占位说明占位说明占位说明占位说明占位说明占位说明占位说明占位说明占位说明占位说明占位说明占位说明占位说明占位说明')),
        ],
      ),
    );
  }
}