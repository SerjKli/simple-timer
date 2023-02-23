import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/modules/play/ui/widgets/hint_dialog/hint_item.dart';
import 'package:simpletimer/widgets/app_gap.dart';
import 'package:simpletimer/widgets/app_icon.dart';
import 'package:simpletimer/widgets/app_watch.dart';
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
        children: const [
          SizedBox(
            // TODO: remove static height and width
            height: 160,
            width: 240,
            child: AppWatch(
              child: AppIcon(icon: FontAwesomeIcons.circleQuestion),
            ),
          ),
          AppGap.verticalMax(),
          HintItem(action: "Double tap", caption: "play/pause timer"),
          AppGap.vertical(),
          HintItem(action: "Long press", caption: "exit from timer"),
          AppGap.vertical(),
          HintItem(action: "Swipe left", caption: "restart current stage"),
          AppGap.vertical(),
          HintItem(action: "Swipe right", caption: "skip stage"),
          AppGap.verticalMax(),
        ],
      ),
    );
  }
}
