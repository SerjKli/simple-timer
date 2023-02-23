import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            height: 160,
            width: 160,
            child: AppWatch(
              child: AppIcon(icon: FontAwesomeIcons.circleQuestion),
            ),
          ),
        ],
      ),
    );
  }
}
