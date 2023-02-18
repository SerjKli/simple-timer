import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/models/TimerModel.dart';
import 'package:simpletimer/modules/play/blocs/active_timer/exports.dart';
import 'package:simpletimer/utils/enums/ColorTypes.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_gap.dart';
import 'package:simpletimer/widgets/app_icon.dart';
import 'package:simpletimer/widgets/app_icon_button.dart';
import 'package:simpletimer/widgets/app_text.dart';

import '../../../../edit_timer/blocs/timer/exports.dart';

class TimerHeader extends StatelessWidget {
  const TimerHeader(
    this.timer, {
    Key? key,
  }) : super(key: key);

  final TimerModel timer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: UiValues.padding2x,
        bottom: UiValues.padding2x,
        left: UiValues.padding2x,
      ),
      child: Row(
        children: [
          const AppIcon(
            icon: Icons.timer_outlined,
            colorType: ColorTypes.light,
          ),
          const AppGap.horizontal(),
          Expanded(child: AppText.h1(timer.name)),
          const AppGap.horizontal(),
          AppText("${timer.rounds} rounds"),
          const AppGap.horizontal(),
          AppIconButton(
            onPressed: () {
              final event = OpenTimerEditingFormEvent(
                timer,
                isEditMode: true,
              );
              context.read<TimerBloc>().add(event);
            },
            icon: FontAwesomeIcons.pencil,
            colorType: ColorTypes.light,
          ),
          AppIconButton(
            onPressed: () {
              final event = ChooseTimerEvent(timer);
              context.read<ActiveTimerBloc>().add(event);
            },
            icon: FontAwesomeIcons.play,
          ),
        ],
      ),
    );
  }
}
