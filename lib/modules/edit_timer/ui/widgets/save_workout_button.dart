import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/widgets/app_button.dart';

import '../../blocs/workout/exports.dart';

class SaveWorkoutButton extends StatelessWidget {
  const SaveWorkoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(
      builder: (context, state) {
        return AppButton(
          title: "Save",
          icon: FontAwesomeIcons.check,
          onTap: () {
            debugPrint("workout = ${state.workout}");
          },
        );
      },
    );
  }
}
