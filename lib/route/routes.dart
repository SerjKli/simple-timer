import 'package:flutter/material.dart';
import 'package:simpletimer/modules/edit_timer/ui/TimerFormScreen.dart';
import 'package:simpletimer/modules/main_screen/ui/MainScreen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainScreen.routeName:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case TimerFormScreen.routeName:
        return MaterialPageRoute(builder: (context) => const TimerFormScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
