import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simpletimer/modules/play/models/DurationModel.dart';
import 'package:simpletimer/modules/settings/blocks/settings/exports.dart';
import 'package:simpletimer/utils/extensions/beatify.dart';
import 'package:simpletimer/utils/services/LocatorService.dart';
import 'package:simpletimer/utils/services/audio_services/AudioServiceContract.dart';

import '../../blocs/active_timer/exports.dart';
import '../../enums/TimerStatus.dart';

typedef TimerTickWidgetBuilder = Widget Function(
  BuildContext context,
  int? durationInSeconds,
);

class TimerTickBuilder extends StatefulWidget {
  final TimerTickWidgetBuilder builder;

  const TimerTickBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  State<TimerTickBuilder> createState() => _TimerTickBuilderState();
}

class _TimerTickBuilderState extends State<TimerTickBuilder> {
  int? duration;
  Timer? timer;
  TimerStatus timerStatus = TimerStatus.ready;

  @override
  void initState() {
    super.initState();
  }

  void _playSound(int currentSecond) {
    final event = PlaySoundOnTimerTickEvent(
      second: currentSecond,
      settings: context.read<SettingsBloc>().state,
    );

    context.read<ActiveTimerBloc>().add(event);
  }

  void _startTimer(DurationModel? durationModel) {
    if (durationModel == null) return;

    setState(() {
      duration = durationModel.duration;
    });

    timer = Timer.periodic(1.toSecondsDuration, (timer) {
      if (duration == null || duration! == 0) {
        timer.cancel();
        context.read<ActiveTimerBloc>().add(const SkipCurrentTimerStageEvent());
      } else {
        duration = duration! - 1;
        _playSound(duration!);

        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    if (timer != null) timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ActiveTimerBloc, ActiveTimerState>(
      listener: (context, state) {
        setState(() {
          if (timer != null) timer!.cancel();
          timerStatus = state.timerStatus;
        });
        switch (timerStatus) {
          case TimerStatus.workout:
          case TimerStatus.preparing:
          case TimerStatus.rest:
            _startTimer(state.activeDuration);
            return;
          default:
            setState(() {
              if (timer != null) timer!.cancel();
              duration = null;
            });
        }
      },
      child: Builder(builder: (context) {
        return widget.builder(context, duration);
      }),
    );
  }
}
