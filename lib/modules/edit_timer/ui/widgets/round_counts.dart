import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/utils/services/ValidatorService.dart';
import 'package:simpletimer/widgets/app_icon_button.dart';
import 'package:simpletimer/widgets/app_input.dart';
import 'package:simpletimer/widgets/app_text.dart';

import '../../blocs/workout/exports.dart';

class RoundCounts extends StatelessWidget {
  const RoundCounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppText("Rounds count"),
        BlocBuilder<WorkoutBloc, WorkoutState>(
          builder: (context, state) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIconButton(
                  onPressed: () {
                    context.read<WorkoutBloc>().add(
                        WorkoutChangeRoundsEvent(state.workout.rounds - 1));
                  },
                  icon: FontAwesomeIcons.minus,
                ),
                SizedBox(
                  width: 60,
                  child: AppInputField.noBorder(
                    controller: state.roundsController,
                    initValue: "1",
                    textAlign: TextAlign.center,
                    inputType: TextInputType.number,
                    maxLength: 2,
                    validator: (value) {
                      return ValidationService.isValidInteger(value);
                    },
                    onSave: (value) {
                      final rounds =
                          value.toString().isNotEmpty ? int.parse(value) : 1;

                      context.read<WorkoutBloc>().add(
                            WorkoutChangeRoundsEvent(rounds),
                          );
                    },
                  ),
                ),
                AppIconButton(
                  onPressed: () {
                    context.read<WorkoutBloc>().add(
                        WorkoutChangeRoundsEvent(state.workout.rounds + 1));
                  },
                  icon: FontAwesomeIcons.plus,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
