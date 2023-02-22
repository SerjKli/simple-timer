import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/utils/services/MessageService.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_icon.dart';
import 'package:simpletimer/widgets/app_screen.dart';
import 'package:simpletimer/widgets/app_watch.dart';

import '../blocs/timer/exports.dart';
import 'widgets/prepare_duration.dart';
import 'widgets/rest_duration.dart';
import 'widgets/round_counts.dart';
import 'widgets/save_timer_button.dart';
import 'widgets/timer_duration.dart';
import 'widgets/timer_name.dart';

class TimerFormScreen extends StatelessWidget {
  static const String routeName = '/timer-form';
  static const double topPartHeightFactor = 0.25;
  static const double bottomPartHeightFactor = 0.75;

  const TimerFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<TimerBloc, TimerState>(
      listener: (context, state) {
        if (state.hasError) {
          MessageService.error(state.errorMessage!);
        }
      },
      child: AppScreen(
        isInSafeArea: false,
        screenTitle: "Timer's properties",
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                SizedBox(
                  height: (constraints.maxHeight * topPartHeightFactor) -
                      (UiValues.buttonHeight / 2),
                  child: const AppWatch(
                    child: AppIcon(icon: FontAwesomeIcons.pencil),
                  ),
                ),
                SizedBox(
                  height: (constraints.maxHeight * bottomPartHeightFactor) -
                      (UiValues.buttonHeight / 2),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        TimerName(),
                        RoundCounts(),
                        PrepareDuration(),
                        TimerDuration(),
                        RestDuration(),
                      ],
                    ),
                  ),
                ),
                const SaveTimerButton(),
              ],
            );
          },
        ),
      ),
    );
  }
}
