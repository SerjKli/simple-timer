import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/modules/play/enums/TimerStatus.dart';
import 'package:simpletimer/utils/enums/ColorTypes.dart';
import 'package:simpletimer/widgets/app_text.dart';

import '../../../../blocs/active_timer/exports.dart';
import 'big_button_template.dart';

class LeftButton extends StatelessWidget {
  const LeftButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const ColorTypes colorType = ColorTypes.brand;

    return BlocBuilder<ActiveTimerBloc, ActiveTimerState>(
      builder: (context, state) {
        switch (state.timerStatus) {
          case TimerStatus.ready:
          case TimerStatus.completed:
            return BigButtonTemplate(
              text: "Exit",
              icon: FontAwesomeIcons.arrowRightFromBracket,
              onTap: () {
                debugPrint("exit"); //TODO: remove debugging
              },
              colorType: colorType,
            );

          case TimerStatus.workout:
          case TimerStatus.rest:
          case TimerStatus.preparing:
            return BigButtonTemplate(
              text: "Pause",
              icon: FontAwesomeIcons.pause,
              onTap: () {
                debugPrint("pause"); //TODO: remove debugging
              },
              colorType: colorType,
            );

          case TimerStatus.pause:
            return BigButtonTemplate(
              text: "Restart",
              icon: FontAwesomeIcons.arrowRotateLeft,
              onTap: () {
                debugPrint("restart"); //TODO: remove debugging
              },
              colorType: colorType,
            );

          default:
            return const AppText(
              "Something wrong",
              colorType: ColorTypes.error,
            );
        }
      },
    );
  }
}
