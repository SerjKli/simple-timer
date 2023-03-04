import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/widgets/app_gap.dart';
import 'package:simpletimer/widgets/app_icon.dart';
import 'package:simpletimer/widgets/app_text.dart';
import 'package:simpletimer/widgets/dialogs/base_dialog.dart';
import 'package:simpletimer/widgets/nothing.dart';

class HintDialog extends StatelessWidget {
  const HintDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: const Nothing(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: -math.pi / 4,
            child: const AppIcon(
              icon: FontAwesomeIcons.faceSmile,
              size: 48,
            ),
          ),
          const AppGap.vertical(),
          const AppText(
            'Have no timer to explain, press on "seconds"',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
