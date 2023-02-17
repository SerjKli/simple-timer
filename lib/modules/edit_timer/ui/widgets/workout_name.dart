import 'package:flutter/material.dart';
import 'package:simpletimer/utils/services/ValidatorService.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_input.dart';

import '../../blocs/workout/exports.dart';

class WorkoutName extends StatelessWidget {
  const WorkoutName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiValues.paddingEdgeLg,
      child: BlocBuilder<WorkoutBloc, WorkoutState>(
        builder: (context, state) {
          return Focus(
            onFocusChange: (hasFocus) {
              if (hasFocus) return;

              context.read<WorkoutBloc>().add(const WorkoutChangeNameEvent());
            },
            child: AppInputField(
              controller: state.nameController,
              title: "Workout's name",
              maxLength: 50,
              autoValidation: true,
              initValue: "",
              validator: (String value) {
                return ValidationService.stringIsValid(value, "Name", 3, 50);
              },
            ),
          );
        },
      ),
    );
  }
}
