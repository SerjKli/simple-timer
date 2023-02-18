import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/models/TimerModel.dart';
import 'package:simpletimer/widgets/app_button.dart';

import '../../../edit_timer/blocs/timer/exports.dart';

class AddTimerButton extends StatelessWidget {
  const AddTimerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: "Create timer",
      icon: FontAwesomeIcons.stopwatch,
      onTap: () {
        final event = OpenTimerEditingFormEvent(
          TimerModel.template(),
        );
        context.read<TimerBloc>().add(event);
      },
    );
  }
}
