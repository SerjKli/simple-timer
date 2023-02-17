import 'package:flutter/material.dart';
import 'package:simpletimer/models/WorkoutModel.dart';

import '../../blocs/workout/exports.dart';
import '../../enums/DurationType.dart';
import 'duration_input.dart';

class WorkoutDuration extends StatelessWidget {
  const WorkoutDuration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WorkoutModel workout = context.read<WorkoutBloc>().state.workout;

    return DurationInputField(
      title: "Workout duration",
      durationTypeMinutes: DurationType.workoutMinutes,
      durationTypeSeconds: DurationType.workoutSeconds,
      currentMinutes: workout.workoutMinutes,
      currentSeconds: workout.workoutSeconds,
    );
  }
}
