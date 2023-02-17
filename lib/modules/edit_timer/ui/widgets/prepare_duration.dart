import 'package:flutter/material.dart';

import '../../blocs/workout/exports.dart';
import '../../enums/DurationType.dart';
import 'duration_input.dart';

class PrepareDuration extends StatelessWidget {
  const PrepareDuration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(
      builder: (context, state) {
        return DurationInputField(
          title: "Prepare duration",
          durationType: DurationType.prepare,
          minutesController: state.prepareMinutesController,
          secondsController: state.prepareSecondsController,
        );
      },
    );
  }
}
