import 'package:flutter/material.dart';
import 'package:simpletimer/utils/enums/ButtonSize.dart';
import 'package:simpletimer/utils/enums/ColorTypes.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_gap.dart';
import 'package:simpletimer/widgets/app_icon.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
  final String title;
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
  }) : super(key: key);

  bool get isIconSet => icon != null;

  const AppButton.regular({
    Key? key,
    required this.title,
    this.icon,
    required this.onTap,
    this.colorType = ColorTypes.brand,
  })  : size = ButtonSize.m,
        super(key: key);

  Size? buttonSize() {
    switch (size) {
      case ButtonSize.xs:
      case ButtonSize.sm:
      case ButtonSize.m:
        return null;
      case ButtonSize.lg:
        return const Size(
          double.infinity,
          UiValues.buttonHeight,
        );
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButtonTheme(
      data: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: buttonSize(),
          backgroundColor: context.colorScheme.getColorByType(colorType),
        ),
      ),
      child: ElevatedButton(
        onPressed: () => onTap(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isIconSet) AppIcon(icon: icon!, colorType: ColorTypes.dark, size: 14),
            if (isIconSet) const AppGap.horizontal(),
            AppText.dark(title),
          ],
        ),
      ),
    );
  }
}
