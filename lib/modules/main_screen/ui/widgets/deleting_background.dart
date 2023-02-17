import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/utils/enums/ColorTypes.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_icon.dart';

class DeletingBackground extends StatelessWidget {
  const DeletingBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.brand,
      padding: const EdgeInsets.only(right: UiValues.padding2x * 2),
      child: const Align(
        alignment: Alignment.centerRight,
        child: AppIcon(
          icon: FontAwesomeIcons.trash,
          colorType: ColorTypes.dark,
        ),
      ),
    );
  }
}
