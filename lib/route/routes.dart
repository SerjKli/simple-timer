import 'package:flutter/material.dart';
import 'package:simpletimer/modules/edit_timer/ui/timer_form_screen.dart';
import 'package:simpletimer/modules/main_screen/ui/main_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainScreen.routeName:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case WorkoutFormScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => const WorkoutFormScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
