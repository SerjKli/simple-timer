import 'package:flutter/material.dart';
import 'package:simpletimer/modules/play/enums/TimerStatus.dart';
import 'package:simpletimer/widgets/app_text.dart';

import '../../../blocs/active_timer/exports.dart';

class TimerTik extends StatelessWidget {
  const TimerTik({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActiveTimerBloc, ActiveTimerState>(
      builder: (context, state) {
        String text;
        switch(state.timerStatus){
          case TimerStatus.workout:
          case TimerStatus.preparing:
          case TimerStatus.rest:
            text = state.timerText;
            break;
          default:text = "--:--";
        }

        return AppText.max(text);
      },
    );
  }
}
