import 'package:flutter/material.dart';

import '../../blocs/workout/exports.dart';
import '../../enums/DurationType.dart';
import 'duration_input.dart';

class WorkoutDuration extends StatelessWidget {
  const WorkoutDuration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(
      builder: (context, state) {
        return DurationInputField(
          title: "Workout duration",
          durationType: DurationType.workout,
          minutesController: state.workoutMinutesController,
          secondsController: state.workoutSecondsController,
        );
      },
    );
  }
}
