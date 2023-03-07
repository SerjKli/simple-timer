import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/utils/enums/ColorTypes.dart';
import 'package:simpletimer/widgets/app_button.dart';
import 'package:simpletimer/widgets/app_icon.dart';
import 'package:simpletimer/widgets/app_text.dart';
import 'package:simpletimer/widgets/dialogs/base_dialog.dart';
import 'package:simpletimer/widgets/nothing.dart';

class ActiveVolumeDialog extends StatelessWidget {
  const ActiveVolumeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double textSize = Theme.of(context).textTheme.bodySmall!.fontSize!;

    return AppDialog(
      title: const Nothing(),
      body: const AppText("Do you want to activate sound option?"),
      actions: [
        AppButton.regular(
          title: Row(
            children: [
              const AppText("Give me sound"),
              SizedBox(
                width: textSize,
              ),
              AppIcon(
                icon: FontAwesomeIcons.music,
                size: textSize,
                colorType: ColorTypes.light,
              ),
            ],
          ),
          colorType: ColorTypes.success,
          onTap: () {
            Navigator.of(context).pop(true);
          },
        ),
        AppButton.regular(
          title: "Keep muted",
          onTap: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}
