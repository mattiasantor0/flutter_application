import 'package:flutter/cupertino.dart';

class App{
    static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext? get context => navigatorKey.currentState?.context;
}