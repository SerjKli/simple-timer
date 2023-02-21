import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';

import 'watch_skins/StartedWatchSkin.dart';

class AppWatch extends StatelessWidget {
  const AppWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          size: Size(constraints.maxWidth, constraints.maxHeight),
          painter: StartedWatchSkinPainter(
            colors: context.colorScheme,
            width: constraints.maxWidth,
            height: constraints.maxHeight,
          ),
        );
      },
    );
  }
}
