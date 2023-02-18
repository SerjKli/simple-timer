import 'package:flutter/material.dart';
import 'package:simpletimer/utils/enums/ColorTypes.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_icon.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final Function()? onLongPress;
  final Function()? onTapCancel;
  final ColorTypes colorType;

  const AppIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.onLongPress,
    this.colorType = ColorTypes.brand,
    this.onTapCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      onTapDown: (details) {
        if (onLongPress != null) onLongPress!();
      },
      onTapUp: (details) {
        if (onTapCancel != null) onTapCancel!();
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
