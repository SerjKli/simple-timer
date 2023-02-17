import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/models/WorkoutModel.dart';
import 'package:simpletimer/modules/main_screen/blocs/workout_list/exports.dart';
import 'package:simpletimer/utils/exceptions/AppException.dart';
import 'package:simpletimer/widgets/app_button.dart';

import '../../blocs/workout/exports.dart';

class SaveWorkoutButton extends StatelessWidget {
  const SaveWorkoutButton({
    Key? key,
  }) : super(key: key);

  void _saveWorkout(BuildContext context, WorkoutState state) {
    FocusManager.instance.primaryFocus?.unfocus();

    final WorkoutModel model = state.workout;

    if (model.hasError) {
      context.read<WorkoutBloc>().add(
            WorkoutSavingErrorEvent(AppException(model.errorMessage!)),
          );
    } else {
      context.read<WorkoutListBloc>().add(WorkoutListAddEvent(model));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(
      builder: (context, state) {
        return AppButton(
          title: "Save",
          icon: FontAwesomeIcons.check,
          onTap: () {
            _saveWorkout(context, state);
          },
        );
      },
    );
  }
}
