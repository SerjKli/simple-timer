import 'package:flutter/material.dart';
import 'package:simpletimer/models/TimerModel.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_gap.dart';
import 'package:simpletimer/widgets/app_text.dart';

class TimerBody extends StatelessWidget {
  final TimerModel timer;

  const TimerBody(
    this.timer, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: UiValues.paddingMax),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: UiValues.iconButtonSize),
          _DurationInfo(
            title: "Preparing",
            time: timer.prepareDurationAsTime,
          ),
          const AppGap.horizontal(),
          const AppGap.horizontal(),
          _DurationInfo(
            title: "Timer",
            time: timer.timerDurationAsTime,
          ),
          const AppGap.horizontal(),
          const AppGap.horizontal(),
          _DurationInfo(
            title: "Rest",
            time: timer.restDurationAsTime,
          ),
        ],
      ),
    );
  }
}

class _DurationInfo extends StatelessWidget {
  final String title;
  final String time;

  const _DurationInfo({
    Key? key,
    required this.title,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.xs(title),
        AppText.xs(time),
      ],
    );
  }
}
