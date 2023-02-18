import 'package:flutter/material.dart';
import 'package:simpletimer/widgets/app_text.dart';

import '../../../blocs/active_timer/exports.dart';
import '../../../extensions/timer_status_extension.dart';

class TimerStatusTitle extends StatelessWidget {
  const TimerStatusTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActiveTimerBloc, ActiveTimerState>(
      builder: (context, state) {
        return AppText.max(state.timerStatus.getTitle());
      },
    );
  }
}
