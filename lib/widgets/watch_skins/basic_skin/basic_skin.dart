import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';
import 'package:simpletimer/widgets/nothing.dart';
import 'package:simpletimer/widgets/watch_skins/basic_skin/second_hand.dart';

import 'skin_background.dart';

class BasicSkin extends StatelessWidget {
  static const String skinName = 'base_skin';

  final Widget? child;
  final bool isActive;

  const BasicSkin({
    Key? key,
    this.child,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            CustomPaint(
              size: Size(constraints.maxWidth, constraints.maxHeight),
              painter: BaseSkinBackgroundPainter(
                colors: context.colorScheme,
              ),
            ),
            if (isActive) const SecondsHand(),
            child != null ? Center(child: child) : const Nothing(),
          ],
        );
      },
    );
  }
}
