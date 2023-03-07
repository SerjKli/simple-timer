import 'package:flutter/material.dart';
import 'package:simpletimer/modules/main_screen/ui/widgets/add_timer_button.dart';
import 'package:simpletimer/modules/main_screen/ui/widgets/timer_list.dart';
import 'package:simpletimer/modules/settings/ui/widgets/to_settings_page_button.dart';
import 'package:simpletimer/modules/statistic/ui/widgets/to_statistic_screen_button.dart';
import 'package:simpletimer/widgets/app_screen.dart';

import 'widgets/test_sound_button.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = "/";

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      isInSafeArea: false,
      screenTitle: "SimpleTimer",
      actions:  const [
        ToStatisticScreenButton(),
        ToSettingsPageButton(),
        // TestSoundButton(),
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
