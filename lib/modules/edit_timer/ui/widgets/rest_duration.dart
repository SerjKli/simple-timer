import 'package:flutter/material.dart';

import '../../blocs/workout/exports.dart';
import '../../enums/DurationType.dart';
import 'duration_input.dart';

class RestDuration extends StatelessWidget {
  const RestDuration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(
      builder: (context, state) {
        return DurationInputField(
          title: "Rest duration",
          durationType: DurationType.rest,
          minutesController: state.restMinutesController,
          secondsController: state.restSecondsController,
        );
      },
    );
  }
}
