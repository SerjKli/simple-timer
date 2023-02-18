import 'package:flutter/material.dart';
import 'package:simpletimer/utils/enums/ColorTypes.dart';
import 'package:simpletimer/widgets/app_button.dart';
import 'package:simpletimer/widgets/app_icon.dart';
import 'package:simpletimer/widgets/app_text.dart';

class BigButtonTemplate extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onTap;
  final ColorTypes colorType;

  const BigButtonTemplate({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.colorType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton.flex(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcon.lg(
            icon: icon,
            colorType: ColorTypes.dark,
          ),
          AppText.dark(text),
        ],
      ),
      onTap: () => onTap(),
      colorType: colorType,
    );
  }
}
