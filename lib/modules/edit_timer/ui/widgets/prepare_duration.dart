import 'package:flutter/material.dart';
import 'package:simpletimer/models/TimerModel.dart';

import '../../blocs/timer/exports.dart';
import '../../enums/DurationType.dart';
import 'duration_input.dart';

class PrepareDuration extends StatelessWidget {
  const PrepareDuration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TimerModel timer = context.read<TimerBloc>().state.timer;

    return DurationInputField(
      title: "Prepare duration",
      durationTypeMinutes: DurationType.prepareMinutes,
      durationTypeSeconds: DurationType.prepareSeconds,
      currentMinutes: timer.prepareMinutes,
      currentSeconds: timer.prepareSeconds,
    );
  }
}
