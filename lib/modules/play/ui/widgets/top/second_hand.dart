import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simpletimer/modules/play/ui/widgets/top/timer_tick_builder.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';

class SecondsHand extends StatelessWidget {
  const SecondsHand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TimerTickBuilder(builder: (context, int? remainingSeconds) {
        // if(remainingSeconds == null) return const Nothing();

        return LayoutBuilder(builder: (context, constraints) {
          return CustomPaint(
            painter: _SecondsHandPainter(
              color: context.colorScheme.brand!,
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              remainingSeconds: 0,
            ),
          );
        });
      }),
    );
  }
}

class _SecondsHandPainter extends CustomPainter {
  static const double handsBaseCircleRadius = 8;
  static const double handLength = 64;
  static const int secondAngle = 6;

  /// 360 degrees / 60 seconds in 1 minute

  final Color color;
  final double width;
  final double height;
  final int remainingSeconds;

  const _SecondsHandPainter({
    required this.color,
    required this.width,
    required this.height,
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

    final radius = min(width / 2, height / 2);

    final outerCircleRadius = radius - handLength;
    const innerCircleRadius = handsBaseCircleRadius;

    final x1 =
        (outerCircleRadius * cos(remainingSeconds * secondAngle * pi / 180));
    final y1 =
        (outerCircleRadius * sin(remainingSeconds * secondAngle * pi / 180));

    final x2 =
        (innerCircleRadius * cos(remainingSeconds * secondAngle * pi / 180));
    final y2 =
        (innerCircleRadius * sin(remainingSeconds * secondAngle * pi / 180));

    canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
