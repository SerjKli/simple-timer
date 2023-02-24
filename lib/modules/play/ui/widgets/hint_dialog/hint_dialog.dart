import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/modules/play/ui/widgets/hint_dialog/hint_item.dart';
import 'package:simpletimer/widgets/app_gap.dart';
import 'package:simpletimer/widgets/app_icon.dart';
import 'package:simpletimer/widgets/app_watch.dart';
import 'package:simpletimer/widgets/dialogs/base_dialog.dart';
import 'package:simpletimer/widgets/nothing.dart';

class HintDialog extends StatelessWidget {
  static const double watchWidth = 280;
  static const double watchHeight = 160;

  const HintDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Size mediaSize = MediaQuery.of(context).size;
    return AppDialog(
      title: const Nothing(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children:  [
          SizedBox(
            height: watchHeight,
            width: min(watchWidth, mediaSize.width),
            child: const AppWatch(
              child: AppIcon(icon: FontAwesomeIcons.circleQuestion),
            ),
          ),
          const AppGap.verticalMax(),
          const HintItem(action: "Double tap", caption: "play/pause timer"),
          const AppGap.vertical(),
          const HintItem(action: "Long press", caption: "exit from timer"),
          const AppGap.vertical(),
          const HintItem(action: "Swipe left", caption: "restart current stage"),
          const AppGap.vertical(),
          const HintItem(action: "Swipe right", caption: "skip stage"),
          const AppGap.verticalMax(),
        ],
      ),
    );
  }
}
