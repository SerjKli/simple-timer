import 'package:flutter/material.dart';
import 'package:simpletimer/modules/main_screen/ui/widgets/add_timer_button.dart';
import 'package:simpletimer/modules/main_screen/ui/widgets/timer_list.dart';
import 'package:simpletimer/widgets/app_icon.dart';
import 'package:simpletimer/widgets/app_screen.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = "/";

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      isInSafeArea: false,
      screenTitle: "Simple Timer Timer",
      actions: [
        IconButton(
          onPressed: () {},
          icon: const AppIcon(icon: Icons.settings),
        ),
      ],
      body: Column(
        children: const [
          Expanded(child: TimerList()),
          AddTimerButton(),
        ],
      ),
    );
  }
}
