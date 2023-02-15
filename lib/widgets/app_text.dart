import 'package:flutter/material.dart';
import 'package:simpletimer/utils/enums/ColorTypes.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';

class AppText extends StatelessWidget {
  final String text;
  final ColorTypes colorType;
  final TextStyle? style;

  const AppText(
    this.text, {
    Key? key,
    this.colorType = ColorTypes.isLight,
    this.style,
  }) : super(key: key);

  const AppText.brand(
    this.text, {
    Key? key,
    this.style,
  })  : colorType = ColorTypes.isBrand,
        super(key: key);

  const AppText.dark(
    this.text, {
    Key? key,
    this.style,
  })  : colorType = ColorTypes.isDark,
        super(key: key);

  Color colorFromType(BuildContext context) {
    switch (colorType) {
      case ColorTypes.isLight:
        return context.colorScheme.light!;
      case ColorTypes.isDark:
        return context.colorScheme.bg!;
      case ColorTypes.isBrand:
        return context.colorScheme.brand!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final styles = style ?? const TextStyle();

    return Text(
      text,
      style: styles.copyWith(
        color: colorFromType(context),
      ),
    );
  }
}
