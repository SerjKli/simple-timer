import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';

class AppText extends StatelessWidget {
  final String text;
  final bool isDark;
  final TextStyle? style;

  const AppText(
    this.text, {
    Key? key,
    this.isDark = false,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = isDark ? context.colorScheme.bg : null;

    final styles = style ?? const TextStyle();

    return Text(
      text,
      style: styles.copyWith(
        color: textColor,
      ),
    );
  }
}
