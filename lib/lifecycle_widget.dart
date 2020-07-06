
import 'package:flutter/material.dart';

class LifecycleWidget extends StatefulWidget {
  LifecycleWidget({
    Key key,
    @required this.child,
  }) : assert(child != null),
       super(key: key);

  final Widget child;

  @override
  _LifecycleWidgetState createState() => _LifecycleWidgetState();
}

class _LifecycleWidgetState extends State<LifecycleWidget> with WidgetsBindingObserver {

  @override
  void initState() { 
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() { 
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<bool> didPopRoute() {
    print('${widget.runtimeType} ------ didPopRoute');
    return super.didPopRoute();
  }

  @override
  Future<bool> didPushRoute(String route) {
    print('${widget.runtimeType} ------ didPushRoute');
    return super.didPushRoute(route);
  }

  @override
  void didUpdateWidget(LifecycleWidget oldWidget) {
    print('${widget.runtimeType} ------ didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    print('${widget.runtimeType} ------ didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('${widget.runtimeType} ------ ${state.toString()}');
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: widget.child,
    );
  }
}