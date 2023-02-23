import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/models/TimerModel.dart';
import 'package:simpletimer/utils/services/ValidatorService.dart';
import 'package:simpletimer/widgets/app_icon_button.dart';
import 'package:simpletimer/widgets/app_input.dart';
import 'package:simpletimer/widgets/app_text.dart';

import '../../blocs/timer/exports.dart';

class RoundCounts extends StatelessWidget {
  const RoundCounts({Key? key}) : super(key: key);

  _changeRounds(BuildContext context, int rounds) {
    context.read<TimerBloc>().add(TimerChangeRoundsEvent(rounds));
  }

  _decreaseRounds(BuildContext context, String value) {
    final rounds = int.parse(value) - TimerModel.defaultRoundStep;
    _changeRounds(context, rounds);
  }

  _increaseRounds(BuildContext context, String value) {
    final rounds = int.parse(value) + TimerModel.defaultRoundStep;
    _changeRounds(context, rounds);
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(
      text: context.read<TimerBloc>().state.timer.rounds.toString(),
    );

    Timer? timerPeriodic;
    Timer? timerDelay;

    return Column(
      children: [
        const AppText("Rounds count"),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIconButton(
              onPressed: () => _decreaseRounds(context, controller.text),
              icon: FontAwesomeIcons.minus,
              allowLongPress: true,
            ),
            SizedBox(
              width: 60,
              child: BlocListener<TimerBloc, TimerState>(
                listener: (context, state) {
                  if (controller.text != state.timer.rounds.toString()) {
                    controller.text = state.timer.rounds.toString();
                  }
                },
                child: AppInputField.noBorder(
                  controller: controller,
                  initValue: "1",
                  textAlign: TextAlign.center,
                  inputType: TextInputType.number,
                  maxLength: 2,
                  validator: (value) {
                    return ValidationService.isValidInteger(value);
                  },
                  onSave: (value) {
                    final rounds = value.toString().isNotEmpty
                        ? int.parse(value)
                        : TimerModel.minimalRounds;

                    context.read<TimerBloc>().add(
                          TimerChangeRoundsEvent(rounds),
                        );
                  },
                ),
              ),
            ),
            AppIconButton(
              onPressed: () => _increaseRounds(context, controller.text),
              icon: FontAwesomeIcons.plus,
              allowLongPress: true,
            ),
          ],
        ),
      ],
    );
  }
}
