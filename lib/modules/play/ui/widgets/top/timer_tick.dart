import 'package:flutter/material.dart';
import 'package:simpletimer/utils/extensions/beatify.dart';
import 'package:simpletimer/widgets/app_text.dart';

import 'timer_tick_builder.dart';

class TimerTik extends StatelessWidget {
  const TimerTik({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimerTickBuilder(
      builder: (context, int? duration) {
        if (duration == null) return const AppText.max("--:--");

        return AppText.max(duration.timeFromDuration());
      },
    );
  }
}
