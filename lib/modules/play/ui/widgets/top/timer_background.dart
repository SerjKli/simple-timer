import 'package:flutter/material.dart';
import 'package:simpletimer/modules/play/enums/TimerStatus.dart';
import 'package:simpletimer/modules/settings/blocks/settings/exports.dart';
import 'package:simpletimer/utils/extensions/beatify.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/nothing.dart';

import '../../../blocs/active_timer/exports.dart';

class TimerBackground extends StatefulWidget {
  const TimerBackground({Key? key}) : super(key: key);

  @override
  State<TimerBackground> createState() => _TimerBackgroundState();
}

class _TimerBackgroundState extends State<TimerBackground> {
  Color backgroundColor = Colors.transparent;

  void _changeBackgroundColor(Color color) {
    backgroundColor = color;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (!state.showBackgroundForActiveTimer) {
          return const Nothing();
        }

        return Center(
          child: BlocListener<ActiveTimerBloc, ActiveTimerState>(
            listenWhen: (previousState, state) {
              return previousState.timerStatus != state.timerStatus;
            },
            listener: (context, state) {
              switch (state.timerStatus) {
                case TimerStatus.workout:
                  _changeBackgroundColor(context.colorScheme.success!.withOpacity(0.6));
                  break;

                case TimerStatus.rest:
                  _changeBackgroundColor(context.colorScheme.light!.withOpacity(0.8));

                  break;
                default:
                  _changeBackgroundColor(Colors.transparent);
              }
            },
            child: LayoutBuilder(builder: (context, constraints) {
              return AnimatedContainer(
                //TODO: remove static
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                duration: UiValues.animationSpeed2x.toMillisecondsDuration,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [backgroundColor, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
