import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simpletimer/utils/enums/TimerStatus.dart';
import 'package:simpletimer/utils/extensions/beatify.dart';
import 'package:simpletimer/utils/theme/color_schema.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_gap.dart';
import 'package:simpletimer/widgets/app_text.dart';
import 'package:simpletimer/widgets/watch_skins/candles_skin/model/CandleModel.dart';

class CandleItem extends StatelessWidget {
  final int appearingDelay;
  final CandleModel model;

  const CandleItem(
    this.model, {
    Key? key,
    this.appearingDelay = 0,
  }) : super(key: key);

  Color _colorFromStatus(AppColorScheme colorScheme) {
    switch (model.status) {
      case TimerStatus.preparing:
        return colorScheme.success!;
      case TimerStatus.workout:
        return colorScheme.brand!;
      case TimerStatus.rest:
        return colorScheme.light!;
      default:
        return Colors.transparent;
    }
  }

  double _calculateHeight(double maxHeight) {
    return maxHeight * model.percentRemaining / 100;
  }

  @override
  Widget build(BuildContext context) {
    final AppColorScheme colorScheme = context.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(UiValues.padding2x),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              final availableHeight =
                  constraints.maxHeight * (model.isActive ? 1 : 0.8);
              final double barWidth = model.isActive ? 64 : 32;
              return _BarItem(
                width: barWidth,
                height: availableHeight,
                color: colorScheme.light!.withOpacity(0.2),
                animationDuration:
                    UiValues.animationSpeed.toMillisecondsDuration,
                alignment: Alignment.center,
                child: _BarItem(
                  animationDuration: 1.toSecondsDuration,
                  width: barWidth,
                  height: _calculateHeight(availableHeight),
                  color: _colorFromStatus(colorScheme),
                  alignment: Alignment.bottomCenter,
                ),
              );
            }),
          ),
          const AppGap.vertical(),
          AppText.xs(
            "${model.secondsRemaining}",
            softWrap: false,
          ),
        ],
      ),
    );
  }
}

class _BarItem extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final Widget? child;
  final Duration animationDuration;
  final Alignment alignment;

  const _BarItem({
    Key? key,
    required this.color,
    required this.height,
    required this.width,
    required this.animationDuration,
    required this.alignment,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: AnimatedContainer(
        duration: animationDuration,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(UiValues.radiusBig),
        ),
        height: height,
        width: min(width, height),
        // width: double.infinity,
        child: child,
      ),
    );
  }
}
