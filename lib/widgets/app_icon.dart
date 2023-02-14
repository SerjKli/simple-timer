import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  final bool isDark;

  const AppIcon({
    Key? key,
    required this.icon,
    this.isDark = false,
    this.size,
  }) : super(key: key);

  const AppIcon.lg({
    Key? key,
    required this.icon,
    this.isDark = false,
  }) : size = 64;

  @override
  Widget build(BuildContext context) {
    final Color color =
        isDark ? context.colorScheme.bg! : context.colorScheme.brand!;

    return FaIcon(icon, color: color, size: size);
  }
}
