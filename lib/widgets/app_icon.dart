import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/utils/enums/ColorTypes.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  final ColorTypes colorType;

  const AppIcon({
    Key? key,
    required this.icon,
    this.colorType = ColorTypes.brand,
    this.size,
  }) : super(key: key);

  const AppIcon.lg({
    Key? key,
    required this.icon,
    this.colorType = ColorTypes.brand,
  }) : size = 64;

  @override
  Widget build(BuildContext context) {
    return FaIcon(
      icon,
      color: context.colorScheme.getColorByType(colorType),
      size: size,
    );
  }
}
