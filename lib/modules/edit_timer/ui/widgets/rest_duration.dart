import 'package:flutter/material.dart';
import 'package:simpletimer/models/WorkoutModel.dart';

import '../../blocs/workout/exports.dart';
import '../../enums/DurationType.dart';
import 'duration_input.dart';

class RestDuration extends StatelessWidget {
  const RestDuration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WorkoutModel workout = context.read<WorkoutBloc>().state.workout;

    return DurationInputField(
      title: "Rest duration",
      durationTypeMinutes: DurationType.restMinutes,
      durationTypeSeconds: DurationType.restSeconds,
      currentMinutes: workout.restMinutes,
      currentSeconds: workout.restSeconds,
    );

  }
}
