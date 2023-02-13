import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/color_schema.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final bool isDark;

  const AppIcon({
    Key? key,
    required this.icon,
    this.isDark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).extension<AppColorScheme>()!;

    final Color color = isDark ? colorScheme.bg! : colorScheme.brand!;
    return Icon(icon, color: color);
  }
}
