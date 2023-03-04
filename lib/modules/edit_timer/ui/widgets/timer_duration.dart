import 'package:flutter/material.dart';
import 'package:simpletimer/models/TimerModel.dart';

import '../../blocs/timer/exports.dart';
import '../../enums/DurationType.dart';
import 'duration_input.dart';

class TimerDuration extends StatelessWidget {
  const TimerDuration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TimerModel timer = context.read<TimerBloc>().state.timer;

    return DurationInputField(
      title: "Workout duration",
      durationTypeMinutes: DurationType.timerMinutes,
      durationTypeSeconds: DurationType.timerSeconds,
      currentMinutes: timer.workoutMinutes,
      currentSeconds: timer.workoutSeconds,
    );
  }
}
