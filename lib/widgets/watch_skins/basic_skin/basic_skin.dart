import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/nothing.dart';
import 'package:simpletimer/widgets/watch_skins/basic_skin/second_hand.dart';

import 'skin_background.dart';

class BasicSkin extends StatelessWidget {
  static const String skinName = 'base_skin';
  static const double maxSkinSize = 240;

  final Widget? child;
  final bool isActive;

  const BasicSkin({
    Key? key,
    this.child,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiValues.paddingEdgeMax,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double size = min(
            min(constraints.maxWidth, constraints.maxHeight),
            maxSkinSize,
          );
          return Stack(
            children: [
              Center(
                child: CustomPaint(
                  size: Size(size, size),
                  painter: BaseSkinBackgroundPainter(
                    colors: context.colorScheme,
                  ),
                ),
              ),
              if (isActive) SecondsHand(size),
              child != null ? Center(child: child) : const Nothing(),
            ],
          );
        },
      ),
    );
  }
}
