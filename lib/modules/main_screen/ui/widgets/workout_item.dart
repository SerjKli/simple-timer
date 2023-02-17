import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/models/WorkoutModel.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_gap.dart';
import 'package:simpletimer/widgets/app_icon.dart';
import 'package:simpletimer/widgets/app_icon_button.dart';
import 'package:simpletimer/widgets/app_text.dart';

class WorkoutItem extends StatelessWidget {
  final WorkoutModel workout;

  const WorkoutItem(this.workout, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiValues.paddingEdgeLg,
      child: Row(
        children: [
          const AppIcon(icon: Icons.timer_outlined),
          const AppGap.horizontal(),
          Expanded(child: AppText.h1(workout.name)),
          const AppGap.horizontal(),
          AppText("${workout.rounds} rounds"),
          const AppGap.horizontal(),
          AppIconButton(onPressed: () {}, icon: FontAwesomeIcons.pencil),
          AppIconButton(onPressed: () {}, icon: FontAwesomeIcons.play),
        ],
      ),
    );
  }
}
