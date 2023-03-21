import 'package:flutter/material.dart';
import 'package:simpletimer/widgets/app_text.dart';

import '../../../../blocs/active_timer/exports.dart';

class StagesLeft extends StatelessWidget {
  final double height;
  final Duration animationSpeed;

  const StagesLeft({
    Key? key,
    required this.height,
    required this.animationSpeed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationSpeed,
      height: height,
      child: Center(
        child: BlocBuilder<ActiveTimerBloc, ActiveTimerState>(
          builder: (context, state) {
            return AppText.dark("${state.workoutLeft} workouts left");
          },
        ),
      ),
    );
  }
}
