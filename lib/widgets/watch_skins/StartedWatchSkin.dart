import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/color_schema.dart';

class StartedWatchSkinPainter extends CustomPainter {
  static const double dashHeightFactor = 0.0436;
  static const double dashWidthFactor = 0.0062;
  static const double borderWidthFactor = 0.0186;
  static const double innerCircleFactor = 0.558;

  final AppColorScheme colors;
  final double width;
  final double height;

  const StartedWatchSkinPainter({
    required this.colors,
    required this.width,
    required this.height,
  });

  double get borderWidth => width * borderWidthFactor;

  double get dashHeight => width * dashHeightFactor;
  double get dashWidth => width * dashWidthFactor;

  // double get dashHeight => 38;
  // double get dashWidth => 6;

  @override
  void paint(Canvas canvas, Size size) {
    debugPrint("${width}x$height"); //TODO: remove debugging
    _paintBaseLayers(canvas, size);

    _paintDashes(canvas, size);

    _paintHand(canvas, size);
  }

  _paintHand(Canvas canvas, Size size) {}

  _paintBaseLayers(Canvas canvas, Size size) {
    /// Main border
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      height / 2,
      Paint()
        ..color = colors.brand!
        ..style = PaintingStyle.stroke
        ..strokeWidth = borderWidth,
    );

    /// Very base layer
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      (height / 2) - borderWidth / 2,
      Paint()..color = colors.bg!,
    );

    /// Center light layer
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      (height / 2) * innerCircleFactor,
      Paint()..color = Colors.white.withOpacity(0.1),
    );

    // /// Circle for hands
    // canvas.drawCircle(
    //   Offset(size.width / 2, size.height / 2),
    //   (height / 2) * 0.58,
    //   Paint()..color = Colors.white.withOpacity(0.1),
    // );
  }

  _paintDashes(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = min(centerX, centerY);

    final dashBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = dashWidth;

    final outerCircleRadius = radius - borderWidth * 1.5;
    final innerCircleRadius = radius - borderWidth - dashHeight * 0.6;

    for (double i = 0; i < 360; i += 30) {
      final x1 = centerX + (outerCircleRadius * cos(i * pi / 180));
      final y1 = centerY + (outerCircleRadius * sin(i * pi / 180));

      final x2 = centerX + (innerCircleRadius * cos(i * pi / 180));
      final y2 = centerY + (innerCircleRadius * sin(i * pi / 180));
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    //TODO: do not repaint
    return true;
  }
}
