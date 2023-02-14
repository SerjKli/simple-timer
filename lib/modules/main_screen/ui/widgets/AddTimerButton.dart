import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/modules/edit_timer/ui/TimerFormScreen.dart';
import 'package:simpletimer/route/NavigationService.dart';
import 'package:simpletimer/utils/services/LocatorService.dart';
import 'package:simpletimer/widgets/app_button.dart';

class AddTimerButton extends StatelessWidget {
  const AddTimerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: "Create timer",
      icon: FontAwesomeIcons.stopwatch,
      onTap: () {
        locator<NavigationService>().pushNamed(TimerFormScreen.routeName);
      },
    );
  }
}
