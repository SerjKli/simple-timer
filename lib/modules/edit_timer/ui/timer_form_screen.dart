import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_gap.dart';
import 'package:simpletimer/widgets/app_screen.dart';
import 'package:simpletimer/widgets/app_watch.dart';

import 'widgets/rest_duration.dart';
import 'widgets/round_counts.dart';
import 'widgets/save_workout_button.dart';
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              SizedBox(
                height: (constraints.maxHeight * 0.3) - (UiValues.buttonHeight / 2),
                child: const AppWatch(),
              ),
              SizedBox(
                height: (constraints.maxHeight * 0.7) - (UiValues.buttonHeight / 2),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      WorkoutName(),
                      RoundCounts(),
                      WorkoutDuration(),
                      RestDuration(),
                    ],
                  ),
                ),
              ),
              const SaveWorkoutButton(),
            ],
          );
        },
      ),
    );
  }
}
