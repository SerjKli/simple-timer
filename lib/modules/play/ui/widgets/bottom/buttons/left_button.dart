import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/modules/play/enums/TimerStatus.dart';
import 'package:simpletimer/utils/enums/ColorTypes.dart';
import 'package:simpletimer/widgets/app_text.dart';

import '../../../../blocs/active_timer/exports.dart';
import 'big_button_template.dart';

class LeftButton extends StatelessWidget {
  const LeftButton({Key? key}) : super(key: key);


  void _exitFromTimer(BuildContext context) {
    context.read<ActiveTimerBloc>().add(const ExitTimerEvent());
  }

  void _pauseTimer(BuildContext context) {
    context.read<ActiveTimerBloc>().add(const PauseTimerEvent());
  }

  void _restartTimer(BuildContext context) {
    context.read<ActiveTimerBloc>().add(const RestartTimerEvent());
  }

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
              onTap: () =>  _exitFromTimer(context),
              colorType: colorType,
            );

          case TimerStatus.workout:
          case TimerStatus.rest:
          case TimerStatus.preparing:
            return BigButtonTemplate(
              text: "Pause",
              icon: FontAwesomeIcons.pause,
              onTap: () => _pauseTimer(context),
              colorType: colorType,
            );

          case TimerStatus.pause:
            return BigButtonTemplate(
              text: "Restart",
              icon: FontAwesomeIcons.arrowRotateLeft,
              onTap: ()  => _restartTimer(context),
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
