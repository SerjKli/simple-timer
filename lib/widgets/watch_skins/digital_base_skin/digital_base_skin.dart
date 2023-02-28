import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simpletimer/modules/play/ui/widgets/timer_tick_builder.dart';
import 'package:simpletimer/utils/extensions/beatify.dart';
import 'package:simpletimer/widgets/app_text.dart';
import 'package:simpletimer/widgets/nothing.dart';

import '../watch_skin.dart';

class DigitalBaseSkin extends WatchSkin {
  static const String skinName = 'digital_base_skin';
  static const double watchFontSizeFactor = 0.236428571428571;

  final Widget? child;
  final bool isActive;

  const DigitalBaseSkin({
    Key? key,
    this.child,
    required this.isActive,
  }) : super(key: key);

  Widget _timerText(int seconds, BoxConstraints constraints) {
    final double size =
        min(constraints.maxWidth, constraints.maxHeight) * watchFontSizeFactor;
    return Center(
      child: AppText.brand(
        seconds.timeFromDuration(),
        style: TextStyle(
          fontFamily: 'Orbitron',
          fontSize: size,
        ),
      ),
    );
    ;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            /// If timer active (user is interacting with it, wrap text in TimerTickBuilder
            if (isActive)
              TimerTickBuilder(builder: (context, int? remainingSeconds) {
                final seconds = remainingSeconds ?? 0;

                return _timerText(seconds, constraints);
              }),

            /// If timer not active (displays on Edit timer's properties screen) show only text widget
            if (!isActive) _timerText(0, constraints),

            /// If timer not active, show background widget
            if (!isActive)
              Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                color: Colors.black.withOpacity(0.86),
                child: child != null ? Center(child: child) : const Nothing(),
              ),
          ],
        );
      },
    );
  }
}
