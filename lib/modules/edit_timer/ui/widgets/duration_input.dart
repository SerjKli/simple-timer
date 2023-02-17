import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/widgets/app_icon_button.dart';
import 'package:simpletimer/widgets/app_input.dart';
import 'package:simpletimer/widgets/app_text.dart';

import '../../blocs/workout/exports.dart';
import '../../enums/DurationType.dart';

class DurationInputField extends StatelessWidget {
  final String title;

  final TextEditingController minutesController;
  final TextEditingController secondsController;

  final DurationType durationType;

  const DurationInputField({
    Key? key,
    required this.title,
    required this.minutesController,
    required this.secondsController,
    required this.durationType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(title),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIconButton(
              onPressed: () {
                context
                    .read<WorkoutBloc>()
                    .add(WorkoutChangeDurationEvent(-5, durationType));
              },
              icon: FontAwesomeIcons.minus,
            ),
            SizedBox(
              width: 60,
              child: Focus(
                onFocusChange: (hasFocus) {
                  if (hasFocus) return;

                  context.read<WorkoutBloc>().add(
                        WorkoutManualSetMinutesEvent(
                            durationType, minutesController.text),
                      );
                },
                child: AppInputField.noBorder(
                  inputType: TextInputType.number,
                  textAlign: TextAlign.right,
                  maxLength: 2,
                  controller: minutesController,
                  validator: (String value) {
                    // return ValidationService.isValidInteger(value, 1, 59);
                    return null;
                  },
                ),
              ),
            ),
            const AppText(":"),
            SizedBox(
              width: 60,
              child: Focus(
                onFocusChange: (hasFocus) {
                  if (hasFocus) return;

                  context.read<WorkoutBloc>().add(
                        WorkoutManualSetSecondsEvent(
                            durationType, secondsController.text),
                      );
                },
                child: AppInputField.noBorder(
                  inputType: TextInputType.number,
                  maxLength: 2,
                  controller: secondsController,
                  validator: (String value) {
                    // return ValidationService.isValidInteger(value, 1, 59);
                    return null;
                  },
                ),
              ),
            ),
            AppIconButton(
              onPressed: () {
                context
                    .read<WorkoutBloc>()
                    .add(WorkoutChangeDurationEvent(5, durationType));
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
