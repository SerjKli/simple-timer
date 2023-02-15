import 'package:flutter/material.dart';
import 'package:simpletimer/modules/edit_timer/ui/widgets/save_workout_button.dart';
import 'package:simpletimer/widgets/app_gap.dart';
import 'package:simpletimer/widgets/app_screen.dart';
import 'package:simpletimer/widgets/app_watch.dart';

import 'widgets/rest_duration.dart';
import 'widgets/round_counts.dart';
import 'widgets/workout_duration.dart';
import 'widgets/workout_name.dart';

class WorkoutFormScreen extends StatelessWidget {
  static const String routeName = '/workout-form';

  const WorkoutFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      isInSafeArea: false,
      screenTitle: "Workout's properties",
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: const [
                AppWatch(),
                Spacer(),
                WorkoutName(),
                WorkoutDuration(),
                Spacer(),
                RoundCounts(),
                AppGap.vertical(),
                RestDuration(),
                Spacer(),
                SaveWorkoutButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
