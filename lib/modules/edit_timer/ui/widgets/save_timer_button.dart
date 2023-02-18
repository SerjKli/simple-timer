import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/models/TimerModel.dart';
import 'package:simpletimer/modules/main_screen/blocs/timer_list/exports.dart';
import 'package:simpletimer/utils/exceptions/AppException.dart';
import 'package:simpletimer/widgets/app_button.dart';

import '../../blocs/timer/exports.dart';

class SaveTimerButton extends StatelessWidget {
  const SaveTimerButton({
    Key? key,
  }) : super(key: key);

  void _saveTimer(BuildContext context, TimerState state) {
    FocusManager.instance.primaryFocus?.unfocus();

    final TimerModel model = state.timer;

    if (model.hasError) {
      context.read<TimerBloc>().add(
            TimerSavingErrorEvent(AppException(model.errorMessage!)),
          );
    } else {
      if (state.isEditMode) {
        context.read<TimerListBloc>().add(TimerListEditEvent(model));
      } else {
        context.read<TimerListBloc>().add(TimerListAddEvent(model));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        String title;
        IconData icon;
        if (state.isEditMode == true) {
          title = "Save changes";
          icon = FontAwesomeIcons.floppyDisk;
        } else {
          title = "Create timer";
          icon = FontAwesomeIcons.check;
        }

        return AppButton(
          title: title,
          icon: icon,
          onTap: () {
            _saveTimer(context, state);
          },
        );
      },
    );
  }
}
