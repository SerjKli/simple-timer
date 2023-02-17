import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  Future<dynamic> pushNamed(String routeName, [args]) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  Future<dynamic> pushReplacementNamed(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  void pop([Map<String, dynamic>? args]) {
    if (navigatorKey.currentState != null && navigatorKey.currentState!.canPop()) {
      return navigatorKey.currentState!.pop(args);
    }
  }
}
