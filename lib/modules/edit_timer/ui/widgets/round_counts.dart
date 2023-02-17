import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/models/WorkoutModel.dart';
import 'package:simpletimer/utils/services/ValidatorService.dart';
import 'package:simpletimer/widgets/app_icon_button.dart';
import 'package:simpletimer/widgets/app_input.dart';
import 'package:simpletimer/widgets/app_text.dart';

import '../../blocs/workout/exports.dart';

class RoundCounts extends StatelessWidget {
  const RoundCounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(
      text: context.read<WorkoutBloc>().state.workout.rounds.toString(),
    );

    return Column(
      children: [
        const AppText("Rounds count"),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIconButton(
              onPressed: () {
                context.read<WorkoutBloc>().add(
                      WorkoutChangeRoundsEvent(int.parse(controller.text) - WorkoutModel.defaultRoundStep),
                    );
              },
              icon: FontAwesomeIcons.minus,
            ),
            SizedBox(
              width: 60,
              child: BlocListener<WorkoutBloc, WorkoutState>(
                listener: (context, state) {
                  if(controller.text != state.workout.rounds.toString()) {
                    controller.text = state.workout.rounds.toString();
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
                    final rounds = value.toString().isNotEmpty ? int.parse(value) : WorkoutModel.minimalRounds;

                    context.read<WorkoutBloc>().add(
                          WorkoutChangeRoundsEvent(rounds),
                        );
                  },
                ),
              ),
            ),
            AppIconButton(
              onPressed: () {
                context.read<WorkoutBloc>().add(
                      WorkoutChangeRoundsEvent(int.parse(controller.text) + WorkoutModel.defaultRoundStep),
                    );
              },
              icon: FontAwesomeIcons.plus,
            ),
          ],
        ),
      ],
    );
  }
}
