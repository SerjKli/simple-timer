import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simpletimer/modules/play/enums/GestureActivity.dart';
import 'package:simpletimer/widgets/app_gap.dart';
import 'package:simpletimer/widgets/app_watch.dart';

import '../../../blocs/active_timer/exports.dart';
import 'timer_status_title.dart';

class Top extends StatelessWidget {
  /// Determinate sensitive of swiping to fire the "swipe" event
  // TODO: check sensitive on iOs and android
  static const double swipeSensitive = 2;

  const Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer? swipeTimer;

    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onDoubleTap: () {
          const event = TimerGestureActivityEvent(GestureActivity.doubleTap);
          context.read<ActiveTimerBloc>().add(event);
        },
        onLongPress: () {
          const event = TimerGestureActivityEvent(GestureActivity.longPress);
          context.read<ActiveTimerBloc>().add(event);
        },
        onHorizontalDragUpdate: (details) {
          if (swipeTimer != null) return;

          swipeTimer = Timer(const Duration(milliseconds: 500), () {
            swipeTimer = null;
          });

          GestureActivity? activity;
          debugPrint("${details.delta.dx}"); //TODO: remove debugging
          if (details.delta.dx > swipeSensitive) {
            activity = GestureActivity.swipeRight;
          }

          if (details.delta.dx < -swipeSensitive) {
            activity = GestureActivity.swipeLeft;
          }

          if (activity == null) return;

          final event = TimerGestureActivityEvent(activity);
          context.read<ActiveTimerBloc>().add(event);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            AppGap.verticalMax(),
            TimerStatusTitle(),
            Expanded(
              child: AppWatch(isActive: true),
            ),
          ],
        ),
      ),
    );
  }
}
