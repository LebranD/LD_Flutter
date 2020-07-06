import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

AppBar createAppBar({
  @required BuildContext context,
  String title,
  Widget titleWidget,
  bool centerTitle,
  Brightness brightness,
  List <Widget> actions,
  PreferredSizeWidget bottom,
  double titleSpacing = NavigationToolbar.kMiddleSpacing,
  VoidCallback onBack,
  Widget leading,
  double elevation = 0,
  double toolbarOpacity = 0,
}) {
  return AppBar(
    title: titleWidget ?? Text(title ?? ''),
    elevation: elevation,
    centerTitle: centerTitle ?? true,
    brightness: brightness,
    actions: actions ?? [SizedBox(width: Theme.of(context).buttonTheme.minWidth,)],
    bottom: bottom,
    leading: leading ?? 
        (onBack != null || !ModalRoute.of(context).isFirst) 
            ? RaisedButton(
                child: SizedBox(width: 10,),
                onPressed: () {
                  if (onBack != null) {
                    onBack();
                  } else {
                    Navigator.maybePop(context);
                  }
                },
              ) : null ,
    titleSpacing: titleSpacing,
    toolbarOpacity: toolbarOpacity,
  );
}

TextSpan createTextSpan({
  TextStyle style,
  String text,
  List <TextSpan> children,
  GestureRecognizer recognizer,
  String semanticsLabel,
}) {
  return TextSpan(
    style: style,
    text: text,
    children: children,
    recognizer: recognizer,
    semanticsLabel: semanticsLabel,
  );
}

Text createText(
  String data, {
  Key key,
  TextStyle style,
  StrutStyle strutStyle,
  TextAlign textAlign,
  TextDirection textDirection,
  Locale locale,
  bool softWrap,
  TextOverflow overflow,
  double textScaleFactor,
  int maxLines,
  String semanticsLabel,
}) {
  return Text(
    data,
    key: key,
    style: style,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    locale: locale,
    softWrap: softWrap,
    overflow: overflow,
    textScaleFactor: textScaleFactor,
    maxLines: maxLines,
    semanticsLabel: semanticsLabel,
  );
}