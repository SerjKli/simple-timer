import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simpletimer/modules/play/ui/widgets/timer_tick_builder.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';

class SecondsHand extends StatelessWidget {
  final double size;
  const SecondsHand(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TimerTickBuilder(builder: (context, int? remainingSeconds) {
        final seconds = remainingSeconds ?? 0;

        return LayoutBuilder(builder: (context, constraints) {
          return Transform.rotate(
            angle: -pi / 2,
            child: CustomPaint(
              size: Size(size, size),
              painter: _SecondsHandPainter(
                color: context.colorScheme.brand!,
                remainingSeconds: seconds,
              ),
            ),
          );
        });
      }),
    );
  }
}

class _SecondsHandPainter extends CustomPainter {
  static const double handsBaseCircleRadius = 8;
  static const double handLengthFactor = 0.225;

  /// 360 degrees / 60 seconds in 1 minute
  static const int secondHandAngleDegrees = 6;

  final Color color;
  final int remainingSeconds;

  int get secondsWithoutMinutes => remainingSeconds % 60;

  const _SecondsHandPainter({
    required this.color,
    required this.remainingSeconds,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _paintCircle(canvas, size);

    _paintHand(canvas, size);
  }

  _paintCircle(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      handsBaseCircleRadius,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4,
    );
  }

  _paintHand(Canvas canvas, Size size) {
    final dashBrush = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;

    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = min(centerX, centerY);
    final innerCircleRadius = radius - (handLengthFactor * size.height);
    const outerCircleRadius = handsBaseCircleRadius;

    final x1 = centerX +
        (outerCircleRadius *
            cos(secondsWithoutMinutes * secondHandAngleDegrees * pi / 180));
    final y1 = centerY +
        (outerCircleRadius *
            sin(secondsWithoutMinutes * secondHandAngleDegrees * pi / 180));

    final x2 = centerX +
        (innerCircleRadius *
            cos(secondsWithoutMinutes * secondHandAngleDegrees * pi / 180));
    final y2 = centerY +
        (innerCircleRadius *
            sin(secondsWithoutMinutes * secondHandAngleDegrees * pi / 180));

    canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
