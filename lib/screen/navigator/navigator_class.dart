//flutter
import 'package:flutter/material.dart';

//navigator sınıfı
class navigatorFunction {
  void navigatoPush(
    Widget widget,
    BuildContext context,
  ) {
    Navigator.push(context, MaterialPageRoute(builder: ((context) => widget)));
  }

  void navigatorPop(BuildContext context) {
    navigatorPop(context);
  }
}
