import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/modules/play/enums/TimerStatus.dart';
import 'package:simpletimer/utils/enums/ColorTypes.dart';
import 'package:simpletimer/widgets/app_text.dart';

import '../../../../blocs/active_timer/exports.dart';
import 'big_button_template.dart';

class RightButton extends StatelessWidget {
  const RightButton({Key? key}) : super(key: key);

  _startTimer(BuildContext context) {
    context.read<ActiveTimerBloc>().add(
          const StartTimerEvent(),
        );
  }

  _skipCurrentDuration(BuildContext context) {
    debugPrint("skip"); //TODO: remove debugging
  }

  @override
  Widget build(BuildContext context) {
    const ColorTypes colorType = ColorTypes.subBrand;

    return BlocBuilder<ActiveTimerBloc, ActiveTimerState>(
      builder: (context, state) {
        return BigButtonTemplate(
          text: "Start",
          icon: FontAwesomeIcons.arrowTurnRight,
          onTap: () => _skipCurrentDuration(context),
          colorType: colorType,
        );

        switch (state.timerStatus) {
          case TimerStatus.ready:
            return BigButtonTemplate(
              text: "Start",
              icon: FontAwesomeIcons.play,
              onTap: () => _startTimer(context),
              colorType: colorType,
            );

          case TimerStatus.workout:
          case TimerStatus.rest:
          case TimerStatus.preparing:
            return BigButtonTemplate(
              text: "Skip",
              icon: FontAwesomeIcons.arrowsTurnRight,
              onTap: () => _skipCurrentDuration(context),
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
    //
    // return BigButtonTemplate(
    //   text: "Start",
    //   icon: FontAwesomeIcons.play,
    //   onTap: () {
    //     context.read<ActiveTimerBloc>().add(
    //           const StartTimerEvent(),
    //         );
    //   },
    //   colorType: ColorTypes.subBrand,
    // );
  }
}
