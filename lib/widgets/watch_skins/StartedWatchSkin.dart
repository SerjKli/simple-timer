import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/color_schema.dart';

class StartedWatchSkinPainter extends CustomPainter {
  static const double dashHeightFactor = 0.1361429;
  static const double dashWidthFactor = 0.01488571;
  static const double borderWidthFactor = 0.02857143;
  static const double innerCircleFactor = 0.24960998;

  final AppColorScheme colors;
  final double width;
  final double height;

  const StartedWatchSkinPainter({
    required this.colors,
    required this.width,
    required this.height,
  });

  double get borderWidth => min(width, height) * borderWidthFactor;

  double get dashHeight => min(width, height) * dashHeightFactor;

  double get dashWidth => min(width, height) * dashWidthFactor;

  double get centerRadius => min(width, height) * innerCircleFactor;

  @override
  void paint(Canvas canvas, Size size) {
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
      centerRadius,
      Paint()..color = Colors.white.withOpacity(0.1),
    );
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
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
