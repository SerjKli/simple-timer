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
    context.read<ActiveTimerBloc>().add(const StartTimerEvent());
  }

  _skipCurrentDuration(BuildContext context) {
    context.read<ActiveTimerBloc>().add(const SkipCurrentTimerStageEvent());
  }

  _continueTimer(BuildContext context) {
    context.read<ActiveTimerBloc>().add(const ContinuePausedTimerEvent());
  }

  _repeatTimer(BuildContext context) {
    context.read<ActiveTimerBloc>().add(const StartTimerEvent());
  }

  @override
  Widget build(BuildContext context) {
    const ColorTypes colorType = ColorTypes.subBrand;

    return BlocBuilder<ActiveTimerBloc, ActiveTimerState>(
      builder: (context, state) {
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
              icon: FontAwesomeIcons.forwardStep,
              onTap: () => _skipCurrentDuration(context),
              colorType: colorType,
            );

          case TimerStatus.pause:
            return BigButtonTemplate(
              text: "Continue",
              icon: FontAwesomeIcons.play,
              onTap: () => _continueTimer(context),
              colorType: colorType,
            );

          case TimerStatus.completed:
            return BigButtonTemplate(
              text: "Repeat",
              icon: FontAwesomeIcons.repeat,
              onTap: () => _repeatTimer(context),
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
