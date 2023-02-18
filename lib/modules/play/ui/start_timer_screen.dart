import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/widgets/app_icon_button.dart';
import 'package:simpletimer/widgets/app_screen.dart';

import 'widgets/bottom/bottom.dart';
import 'widgets/top/top.dart';

class StartTimerScreen extends StatelessWidget {
  static const String routeName = '/start-timer';
  static const double topPartHeightFactor = 0.6;
  static const double bottomPartHeightFactor = 0.4;

  const StartTimerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: ! before leave the screen stop all timers!!!

    return AppScreen(
      isInSafeArea: false,
      screenTitle: "SimpleTimer", //TODO: set timer's name

      actions: [
        AppIconButton(onPressed: () {}, icon: FontAwesomeIcons.circleQuestion),
      ],

      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              SizedBox(
                height: (constraints.maxHeight * topPartHeightFactor),
                child: const Top(),
              ),
              SizedBox(
                height: (constraints.maxHeight * bottomPartHeightFactor),
                child: const Bottom(),
              ),
            ],
          );
        },
      ),
    );
  }
}
