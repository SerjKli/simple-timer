import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';

import 'nothing.dart';
import 'watch_skins/StartedWatchSkin.dart';

class AppWatch extends StatelessWidget {
  final Widget? child;

  const AppWatch({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            CustomPaint(
              size: Size(constraints.maxWidth, constraints.maxHeight),
              painter: StartedWatchSkinPainter(
                colors: context.colorScheme,
                width: constraints.maxWidth,
                height: constraints.maxHeight,
              ),
            ),
            child ?? const Nothing(),
          ],
        );
      },
    );
  }
}
