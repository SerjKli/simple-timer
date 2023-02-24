import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/models/TimerModel.dart';
import 'package:simpletimer/modules/play/enums/TimerStatus.dart';
import 'package:simpletimer/modules/play/ui/widgets/hint_dialog/hint_dialog.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_icon_button.dart';
import 'package:simpletimer/widgets/app_screen.dart';

import '../blocs/active_timer/exports.dart';
import 'widgets/bottom/bottom.dart';
import 'widgets/top/top.dart';

class StartTimerScreen extends StatefulWidget {
  static const String routeName = '/start-timer';

  const StartTimerScreen({Key? key}) : super(key: key);

  @override
  State<StartTimerScreen> createState() => _StartTimerScreenState();
}

class _StartTimerScreenState extends State<StartTimerScreen> {
  String timerName = "SimpleTimer";
  double topPartHeightFactor = 0.6;
  double bottomPartHeightFactor = 0.4;

  bool showControlButtons = false;

  void _changeControlButtonsVisible(bool newExpandedStatus) {
    showControlButtons = newExpandedStatus;

    if (showControlButtons) {
      topPartHeightFactor = 0.9;
      bottomPartHeightFactor = 0.1;
    } else {
      topPartHeightFactor = 0.6;
      bottomPartHeightFactor = 0.4;
    }

    setState(() {});
  }

  void _setTimerName(TimerModel? timer) {
    if (timer == null) return;

    timerName = timer.name;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _changeControlButtonsVisible(!showControlButtons),
      child: AppScreen(
        isInSafeArea: false,
        screenTitle: timerName,

        actions: [
          AppIconButton(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const HintDialog();
                },
              );
            },
            icon: FontAwesomeIcons.circleQuestion,
          ),
        ],

        body: BlocListener<ActiveTimerBloc, ActiveTimerState>(
          listener: (context, state) {
            _setTimerName(state.timer);

            /// Show buttons on timer complete
            if (state.timerStatus == TimerStatus.completed && showControlButtons) {
              _changeControlButtonsVisible(false);
            }
          },
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  AnimatedContainer(
                    duration: UiValues.animationDuration,
                    height: (constraints.maxHeight * topPartHeightFactor),
                    child: const Top(),
                  ),
                  AnimatedContainer(
                    duration: UiValues.animationDuration,
                    height: (constraints.maxHeight * bottomPartHeightFactor),
                    child: const Bottom(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
