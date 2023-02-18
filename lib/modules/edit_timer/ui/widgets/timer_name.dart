import 'package:flutter/material.dart';
import 'package:simpletimer/models/TimerModel.dart';
import 'package:simpletimer/utils/services/ValidatorService.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_input.dart';

import '../../blocs/timer/exports.dart';

class TimerName extends StatelessWidget {
  const TimerName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(
      text: context.read<TimerBloc>().state.timer.name,
    );

    return Padding(
      padding: UiValues.paddingEdgeLg,
      child: AppInputField(
        controller: controller,
        title: "Timer's name",
        maxLength: 50,
        autoValidation: true,
        initValue: "",
        validator: (String value) {
          return ValidationService.stringIsValid(
            value,
            "Name",
            TimerModel.nameMinLength,
            TimerModel.nameMaxLength,
          );
        },
        onSave: (value) {
          context.read<TimerBloc>().add(TimerChangeNameEvent(value));
        },
      ),
    );
  }
}
