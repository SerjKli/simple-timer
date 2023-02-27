import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simpletimer/modules/play/ui/widgets/bottom/progress/stages_left.dart';
import 'package:simpletimer/utils/extensions/beatify.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';

import 'progress_bar.dart';

class CurrentProgress extends StatelessWidget {
  const CurrentProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final widgetHeight = min(UiValues.buttonHeight, constraints.maxHeight);
      final animationSpeed = UiValues.animationSpeed.toMillisecondsDuration;

      return Stack(
        children: [
          AnimatedContainer(
            duration: animationSpeed,
            height: widgetHeight,
            width: constraints.maxWidth,
            color: context.colorScheme.brand,
          ),
          ProgressBar(
            animationSpeed: animationSpeed,
            height: widgetHeight,
          ),
          StagesLeft(
            height: widgetHeight,
            animationSpeed: animationSpeed,
          ),
        ],
      );
    });
  }
}
