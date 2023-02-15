import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_icon.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final Function()? onLongPress;

  const AppIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      onLongPress: onLongPress,
      customBorder: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(UiValues.radiusBig),
      ),
      radius: 24,
      child: Container(
        alignment: Alignment.center,
        width: 48,
        height: 48,
        child: AppIcon(icon: icon),
      ),
    );
  }
}
