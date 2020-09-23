import 'package:first_flutter/utility/button.dart';
import 'package:flutter/material.dart';

import 'tab_page.dart';

class AppPage extends StatefulWidget {

  AppPage({Key key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Future<bool> didPopRoute() {
    print('AppPageState ======= didPopRoute');
    return super.didPopRoute();
  }

  @override
  Future<bool> didPushRoute(String route) {
    print('AppPageState ====== didPushRoute');
    return super.didPushRoute(route);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('AppPageState didChangeAppLifecycleState == $state');
  }

  @override
  void didChangeAccessibilityFeatures() {
    super.didChangeAccessibilityFeatures();
    print('AppPageState didChangeAccessibilityFeatures');
  }

  @override
  void didChangeLocales(List<Locale> locale) {
    super.didChangeLocales(locale);
    print('AppPageState didChangeLocales');
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    print('AppPageState didChangeMetrics');
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    print('AppPageState didChangePlatformBrightness');
  }

  @override
  void didChangeTextScaleFactor() {
    super.didChangeTextScaleFactor();
    print('AppPageState didChangeTextScaleFactor');
  }

  @override
  void didHaveMemoryPressure() {
    super.didHaveMemoryPressure();
    print('AppPageState didChangeTextScaleFactor');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TabPage(),
        Positioned(
          right: 15,
          bottom: MediaQuery.of(context).padding.bottom + kTextTabBarHeight,
          child: Button(
            child: Icon(Icons.add), 
            onPressed: () {
              showDatePicker(
                context: context, 
                initialDate: DateTime.now(), 
                firstDate: DateTime.now(), 
                lastDate: DateTime.parse('2020-09-30')
              );
            }
          ),
        ),
      ],
    );
  }
}
