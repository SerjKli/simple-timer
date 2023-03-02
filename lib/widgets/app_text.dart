import 'package:flutter/material.dart';
import 'package:simpletimer/utils/enums/ColorTypes.dart';
import 'package:simpletimer/utils/theme/ThemeService.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';

class AppText extends StatelessWidget {
  final String text;
  final ColorTypes colorType;
  final TextStyle? style;
  final TextAlign textAlign;
  final bool softWrap;

  const AppText(
    this.text, {
    Key? key,
    this.colorType = ColorTypes.light,
    this.style,
    this.textAlign = TextAlign.start,
    this.softWrap = true,
  }) : super(key: key);

  const AppText.brand(
    this.text, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.softWrap = true,
  })  : colorType = ColorTypes.brand,
        super(key: key);

  const AppText.dark(
    this.text, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.softWrap = true,
  })  : colorType = ColorTypes.dark,
        super(key: key);

  const AppText.h1(
    this.text, {
    Key? key,
    this.textAlign = TextAlign.start,
    this.softWrap = true,
  })  : colorType = ColorTypes.brand,
        style = const TextStyle(
          fontSize: ThemeService.fontSizeLg,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  const AppText.max(
    this.text, {
    Key? key,
    this.textAlign = TextAlign.start,
    this.softWrap = true,
  })  : colorType = ColorTypes.brand,
        style = const TextStyle(
          fontSize: ThemeService.fontSizeMax,
          fontWeight: FontWeight.bold,
        ),
        super(key: key);

  const AppText.xs(
    this.text, {
    Key? key,
    this.textAlign = TextAlign.start,
    this.softWrap = true,
  })  : colorType = ColorTypes.light,
        style = const TextStyle(fontSize: ThemeService.fontSizeSm),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = style ?? const TextStyle();

    return Text(
      text,
      overflow: TextOverflow.clip,
      textAlign: textAlign,
      softWrap: softWrap,
      style: styles.copyWith(
        color: context.colorScheme.getColorByType(colorType),
      ),
    );
  }
}
