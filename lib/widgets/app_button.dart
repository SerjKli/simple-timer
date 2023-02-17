import 'package:flutter/material.dart';
import 'package:simpletimer/utils/enums/ColorTypes.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_gap.dart';
import 'package:simpletimer/widgets/app_icon.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Function onTap;

  const AppButton({
    Key? key,
    required this.title,
    this.icon,
    required this.onTap,
  }) : super(key: key);

  bool get isIconSet => icon != null;

  @override
  Widget build(BuildContext context) {
    return ElevatedButtonTheme(
      data: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(
            double.infinity,
            UiValues.buttonHeight,
          ), // put the width and height you want
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
            AppText.dark(title),
          ],
        ),
      ),
    );
  }
}
