import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/route/NavigationService.dart';
import 'package:simpletimer/utils/services/LocatorService.dart';
import 'package:simpletimer/widgets/app_icon.dart';

import '../statistic_screen.dart';

class ToStatisticScreenButton extends StatelessWidget {
  const ToStatisticScreenButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        locator<NavigationService>().pushNamed(StatisticScreen.routeName);
      },
      icon: const AppIcon(icon: FontAwesomeIcons.chartLine),
    );
  }
}
