import 'package:flutter/material.dart';
import 'package:simpletimer/models/WorkoutModel.dart';

import '../../blocs/workout/exports.dart';
import '../../enums/DurationType.dart';
import 'duration_input.dart';

class PrepareDuration extends StatelessWidget {
  const PrepareDuration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final WorkoutModel workout = context.read<WorkoutBloc>().state.workout;

    return DurationInputField(
      title: "Prepare duration",
      durationTypeMinutes: DurationType.prepareMinutes,
      durationTypeSeconds: DurationType.prepareSeconds,
      currentMinutes: workout.prepareMinutes,
      currentSeconds: workout.prepareSeconds,
    );
  }
}
