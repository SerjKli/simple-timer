import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simpletimer/utils/enums/ColorTypes.dart';
import 'package:simpletimer/utils/extensions/beatify.dart';
import 'package:simpletimer/utils/services/VibrationService.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_icon.dart';

class AppIconButton extends StatelessWidget {
  /// Icon
  final IconData icon;

  /// Callback for onTap event
  final Function onPressed;

  /// If true, button provides long press tapping,
  /// and with [UiValues.animationDuration2x] speed calls [onPressed] callback
  final bool allowLongPress;

  /// Color
  final ColorTypes colorType;

  const AppIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.colorType = ColorTypes.brand,
    this.allowLongPress = false,
  }) : super(key: key);

  _buttonPressed() {
    VibrationService.vibrate();
    onPressed();
  }

  @override
  Widget build(BuildContext context) {
    Timer? timerPeriodic;
    Timer? timerDelay;

    return InkWell(
      onTap: () => _buttonPressed(),
      onTapDown: (details) {
        if (!allowLongPress) return;

        timerDelay = Timer(
          UiValues.animationSpeed2x.toMillisecondsDuration,
          () {
            timerPeriodic = Timer.periodic(
              UiValues.animationSpeed2x.toMillisecondsDuration,
              (_) => _buttonPressed(),
            );
          },
        );
      },
      onTapUp: (details) {
        if (!allowLongPress) return;

        if (timerDelay != null) timerDelay!.cancel();
        if (timerPeriodic != null) timerPeriodic!.cancel();
      },
      customBorder: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(UiValues.radiusBig),
      ),
      radius: UiValues.iconButtonSize / 2,
      child: Container(
        alignment: Alignment.center,
        width: UiValues.iconButtonSize,
        height: UiValues.iconButtonSize,
        child: AppIcon(icon: icon, colorType: colorType),
      ),
    );
  }
}
