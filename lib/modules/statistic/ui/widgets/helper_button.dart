import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/widgets/app_icon_button.dart';

import 'hint_dialog.dart';

class HelperButton extends StatelessWidget {
  const HelperButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      onPressed: () async {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return const HintDialog();
          },
        );
      },
      icon: FontAwesomeIcons.circleQuestion,
    );
  }
}
