import 'package:flutter/material.dart';
import 'package:simpletimer/models/TimerModel.dart';

import '../../blocs/timer/exports.dart';
import '../../enums/DurationType.dart';
import 'duration_input.dart';

class RestDuration extends StatelessWidget {
  const RestDuration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TimerModel timer = context.read<TimerBloc>().state.timer;

    return DurationInputField(
      title: "Rest duration",
      durationTypeMinutes: DurationType.restMinutes,
      durationTypeSeconds: DurationType.restSeconds,
      currentMinutes: timer.restMinutes,
      currentSeconds: timer.restSeconds,
    );
  }
}
