import 'package:flutter/material.dart';
import 'package:simpletimer/modules/main_screen/ui/widgets/empty_timer_list.dart';

import '../../blocs/workout_list/exports.dart';

class WorkoutList extends StatelessWidget {
  const WorkoutList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutListBloc, WorkoutListState>(
      builder: (context, state) {
        if (state.isEmpty) return const EmptyWorkoutList();

        return ListView.builder(
          itemCount: state.timersLength,
          itemBuilder: (_, int index) {
            return Text(state.allTimers[index].name);
          },
        );
      },
    );
  }
}
