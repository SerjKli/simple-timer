import 'package:flutter/material.dart';
import 'package:simpletimer/modules/main_screen/ui/widgets/EmptyTimerList.dart';

import '../../blocs/timer_list/exports.dart';

class TimersList extends StatelessWidget {
  const TimersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerListBloc, TimerListState>(
      builder: (context, state) {
        if (state.isEmpty) return const EmptyTimerList();

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
