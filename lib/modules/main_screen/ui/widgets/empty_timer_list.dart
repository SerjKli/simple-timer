import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_gap.dart';
import 'package:simpletimer/widgets/app_icon.dart';
import 'package:simpletimer/widgets/app_text.dart';

class EmptyWorkoutList extends StatelessWidget {
  const EmptyWorkoutList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        //TODO: make default opacity widget
        Opacity(
          opacity: UiValues.opacity,
          child: AppIcon.lg(icon: FontAwesomeIcons.listUl),
        ),
        AppGap.vertical(),
        AppText("Ready to add a new timer?"),
      ],
    );
  }
}
