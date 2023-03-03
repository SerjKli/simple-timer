import 'package:flutter/material.dart';
import 'package:simpletimer/modules/edit_timer/ui/timer_form_screen.dart';
import 'package:simpletimer/modules/main_screen/ui/main_screen.dart';
import 'package:simpletimer/modules/play/ui/start_timer_screen.dart';
import 'package:simpletimer/modules/settings/ui/settings_screen.dart';
import 'package:simpletimer/modules/statistic/ui/statistic_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainScreen.routeName:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case TimerFormScreen.routeName:
        return MaterialPageRoute(builder: (context) => const TimerFormScreen());
      case StartTimerScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => const StartTimerScreen());
      case SettingsScreen.routeName:
        return MaterialPageRoute(builder: (context) => const SettingsScreen());
      case StatisticScreen.routeName:
        return MaterialPageRoute(builder: (context) => const StatisticScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
