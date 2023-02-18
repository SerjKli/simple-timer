import 'package:flutter/material.dart';
import 'package:simpletimer/utils/enums/ColorTypes.dart';
import 'package:simpletimer/utils/theme/ThemeService.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';

class AppText extends StatelessWidget {
  final String text;
  final ColorTypes colorType;
  final TextStyle? style;

  const AppText(
    this.text, {
    Key? key,
    this.colorType = ColorTypes.light,
    this.style,
  }) : super(key: key);

  const AppText.brand(
    this.text, {
    Key? key,
    this.style,
  })  : colorType = ColorTypes.brand,
        super(key: key);

  const AppText.dark(
    this.text, {
    Key? key,
    this.style,
  })  : colorType = ColorTypes.dark,
        super(key: key);

  const AppText.h1(
    this.text, {
    Key? key,
  })  : colorType = ColorTypes.brand,
        style = const TextStyle(
          //TODO: remove static and take data from theme
          fontSize: ThemeService.fontSizeLg,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  const AppText.max(
    this.text, {
    Key? key,
  })  : colorType = ColorTypes.brand,
        style = const TextStyle(
          //TODO: remove static and take data from theme
          fontSize: ThemeService.fontSizeMax,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  const AppText.xs(
    this.text, {
    Key? key,
  })  : colorType = ColorTypes.light,
        style = const TextStyle(
            fontSize: ThemeService
                .fontSizeSm //TODO: remove static and take data from theme
            ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = style ?? const TextStyle();

    return Text(
      text,
      style: styles.copyWith(
        color: context.colorScheme.getColorByType(colorType),
      ),
    );
  }
}