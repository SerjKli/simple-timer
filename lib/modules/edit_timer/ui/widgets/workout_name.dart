import 'package:flutter/material.dart';
import 'package:simpletimer/models/WorkoutModel.dart';
import 'package:simpletimer/utils/services/ValidatorService.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_input.dart';

import '../../blocs/workout/exports.dart';

class WorkoutName extends StatelessWidget {
  const WorkoutName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(
      text: context.read<WorkoutBloc>().state.workout.name,
    );

    return Padding(
      padding: UiValues.paddingEdgeLg,
      child: AppInputField(
        controller: controller,
        title: "Workout's name",
        maxLength: 50,
        autoValidation: true,
        initValue: "",
        validator: (String value) {
          return ValidationService.stringIsValid(
            value,
            "Name",
            WorkoutModel.nameMinLength,
            WorkoutModel.nameMaxLength,
          );
        },
        onSave: (value) {
          context.read<WorkoutBloc>().add(WorkoutChangeNameEvent(value));
        },
      ),
    );
  }
}
