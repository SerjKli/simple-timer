import 'package:flutter/material.dart';
import 'package:simpletimer/modules/play/ui/widgets/timer_tick_builder.dart';
import 'package:simpletimer/utils/extensions/beatify.dart';
import 'package:simpletimer/widgets/app_text.dart';
import 'package:simpletimer/widgets/nothing.dart';

class DigitalBaseSkin extends StatelessWidget {
  static const String skinName = 'digital_base_skin';
  static const double watchFontSizeFactor = 0.306428571428571;

  final Widget? child;
  final bool isActive;

  const DigitalBaseSkin({
    Key? key,
    this.child,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Center(
            child: TimerTickBuilder(builder: (context, int? remainingSeconds) {
              final seconds = remainingSeconds ?? 0;

              return LayoutBuilder(builder: (context, constraints) {
                return AppText.brand(
                  seconds.timeFromDuration(),
                  style: TextStyle(
                    fontFamily: 'Orbitron',
                    fontSize: constraints.maxHeight * watchFontSizeFactor,
                  ),
                );
              });
            }),
          ),
          if (!isActive)
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  color: Colors.black.withOpacity(0.86),
                  child: child != null ? Center(child: child) : const Nothing(),
                );
              },
            ),
        ],
      ),
    );
  }
}
