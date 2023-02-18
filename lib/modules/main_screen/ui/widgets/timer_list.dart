import 'package:flutter/material.dart';
import 'package:simpletimer/modules/main_screen/ui/widgets/empty_timer_list.dart';
import 'package:simpletimer/modules/main_screen/ui/widgets/timer_item/timer_item.dart';

import '../../blocs/timer_list/exports.dart';

class TimerList extends StatelessWidget {
  const TimerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerListBloc, TimerListState>(
      builder: (context, state) {
        if (state.isEmpty) return const EmptyTimerList();

        return ListView.builder(
          itemCount: state.timersLength,
          itemBuilder: (_, int index) {
            return TimerItem(
              key: ValueKey<String>(
                "list-timer-item-${state.allTimers[index].uuid}",
              ),
              state.allTimers[index],
            );
          },
        );
      },
    );
  }
}
