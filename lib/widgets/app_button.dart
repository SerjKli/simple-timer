import 'package:flutter/material.dart';
import 'package:simpletimer/utils/enums/ButtonSize.dart';
import 'package:simpletimer/utils/enums/ColorTypes.dart';
import 'package:simpletimer/utils/extensions/button_extension.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';
import 'package:simpletimer/widgets/app_gap.dart';
import 'package:simpletimer/widgets/app_icon.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
  final dynamic title;
  final IconData? icon;
  final Function onTap;
  final ButtonSize size;
  final ColorTypes colorType;

  const AppButton({
    Key? key,
    required this.title,
    this.icon,
    required this.onTap,
    this.size = ButtonSize.lg,
    this.colorType = ColorTypes.brand,
  })  : assert(title is String || title is Widget),
        super(key: key);

  bool get isIconSet => icon != null;

  const AppButton.regular({
    Key? key,
    required this.title,
    this.icon,
    required this.onTap,
    this.colorType = ColorTypes.brand,
  })  : assert(title is String || title is Widget),
        size = ButtonSize.m,
        super(key: key);

  const AppButton.flex({
    Key? key,
    required this.title,
    this.icon,
    required this.onTap,
    this.colorType = ColorTypes.brand,
  })  : assert(title is String || title is Widget),
        size = ButtonSize.flex,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorTypes textColor =
        colorType == ColorTypes.error ? ColorTypes.light : ColorTypes.dark;

    return ElevatedButtonTheme(
      data: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: size.getSize(),
          backgroundColor: context.colorScheme.getColorByType(colorType),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        ),
      ),
      child: ElevatedButton(
        onPressed: () => onTap(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isIconSet)
              AppIcon(icon: icon!, colorType: ColorTypes.dark, size: 14),
            if (isIconSet) const AppGap.horizontal(),
            if (title is String) AppText(title, colorType: textColor),
            if (title is Widget) title,
          ],
        ),
      ),
    );
  }
}
