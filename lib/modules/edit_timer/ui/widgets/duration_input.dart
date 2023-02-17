import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/models/WorkoutModel.dart';
import 'package:simpletimer/utils/extensions/beatify.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_icon_button.dart';
import 'package:simpletimer/widgets/app_input.dart';
import 'package:simpletimer/widgets/app_text.dart';

import '../../blocs/workout/exports.dart';
import '../../enums/DurationType.dart';

class DurationInputField extends StatelessWidget {
  final String title;
  final int currentMinutes;
  final int currentSeconds;

  final DurationType durationTypeMinutes;
  final DurationType durationTypeSeconds;

  const DurationInputField({
    Key? key,
    required this.title,
    required this.durationTypeMinutes,
    required this.durationTypeSeconds,
    required this.currentMinutes,
    required this.currentSeconds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController minutesController = TextEditingController(
      text: currentMinutes.beautifyForTime,
    );
    final TextEditingController secondsController = TextEditingController(
      text: currentSeconds.beautifyForTime,
    );

    return Column(
      children: [
        AppText(title),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIconButton(
              onPressed: () {
                final event = WorkoutVaryDurationEvent(
                  -WorkoutModel.defaultSecondsStep,
                  durationTypeSeconds,
                );
                context.read<WorkoutBloc>().add(event);
              },
              icon: FontAwesomeIcons.minus,
            ),
            SizedBox(
              width: UiValues.timeBoxWidth,
              child: BlocListener<WorkoutBloc, WorkoutState>(
                listener: (context, state) {
                  // TODO: ! move logic from UI
                  final int currentDurationValue =
                  state.getDurationValueByDurationType(durationTypeMinutes);

                  if (minutesController.text.isEmpty && currentDurationValue == 0) return;

                  if (currentDurationValue != int.parse(minutesController.text)) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    minutesController.text = currentDurationValue.beautifyForTime;
                  }
                },
                child: Focus(
                  onFocusChange: (hasFocus) {
                    if (hasFocus) return;

                    minutesController.text = minutesController.text.beautifyForTime;
                  },
                  child: AppInputField.noBorder(
                    inputType: TextInputType.number,
                    textAlign: TextAlign.right,
                    maxLength: 2,
                    controller: minutesController,
                    validator: (String value) {
                      return null;
                    },
                    onSave: (String minutes) {
                      minutes = minutes.isEmpty ? "0" : minutes;

                      final event = WorkoutManualChangeMinutesDurationEvent(
                        minutes,
                        durationTypeMinutes,
                      );

                      context.read<WorkoutBloc>().add(event);
                    },
                  ),
                ),
              ),
            ),
            const AppText(":"),
            SizedBox(
              width: UiValues.timeBoxWidth,
              child: Focus(
                onFocusChange: (hasFocus) {
                  if (hasFocus) return;
                  secondsController.text = secondsController.text.beautifyForTime;
                },
                child: BlocListener<WorkoutBloc, WorkoutState>(
                  listener: (context, state) {
                    // TODO: ! move logic from UI
                    final int currentDurationValue =
                    state.getDurationValueByDurationType(durationTypeSeconds);

                    if (secondsController.text.isEmpty && currentDurationValue == 0) return;

                    if (currentDurationValue != int.parse(secondsController.text)) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      secondsController.text = currentDurationValue.beautifyForTime;
                    }
                  },
                  child: AppInputField.noBorder(
                    inputType: TextInputType.number,
                    maxLength: 2,
                    controller: secondsController,
                    validator: (String value) {
                      return null;
                    },
                    onSave: (String seconds) {
                      seconds = seconds.isEmpty ? "0" : seconds;

                      final event = WorkoutManualChangeSecondsDurationEvent(
                        seconds,
                        durationTypeSeconds,
                      );

                      context.read<WorkoutBloc>().add(event);
                    },
                  ),
                ),
              ),
            ),
            AppIconButton(
              onPressed: () {
                final event = WorkoutVaryDurationEvent(
                  WorkoutModel.defaultSecondsStep,
                  durationTypeSeconds,
                );
                context.read<WorkoutBloc>().add(event);
              },
              icon: FontAwesomeIcons.plus,
              // onLongPress: () {}, //TODO: implement long press
            ),
          ],
        ),
      ],
    );
  }
}
