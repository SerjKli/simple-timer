import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_text.dart';

import '../../../blocs/active_timer/exports.dart';

class CurrentProgress extends StatefulWidget {
  const CurrentProgress({Key? key}) : super(key: key);

  @override
  State<CurrentProgress> createState() => _CurrentProgressState();
}

class _CurrentProgressState extends State<CurrentProgress> {
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          Container(
            height: UiValues.buttonHeight,
            width: constraints.maxWidth,
            color: context.colorScheme.brand,
          ),
          BlocListener<ActiveTimerBloc, ActiveTimerState>(
            listener: (context, state) {
              setState(() {
                progress = state.progressPercent;
              });
            },
            child: AnimatedContainer(
              height: UiValues.buttonHeight,
              width: constraints.maxWidth * progress / 100,
              color: context.colorScheme.subBrand,
              duration: UiValues.animationDuration,
            ),
          ),
          const SizedBox(
            height: UiValues.buttonHeight,
            child: Center(
              child: AppText.dark('current progress...'),
            ),
          ),
        ],
      );
    });
  }
}
