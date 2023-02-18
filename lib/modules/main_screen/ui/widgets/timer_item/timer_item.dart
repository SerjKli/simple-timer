import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:simpletimer/models/TimerModel.dart';
import 'package:simpletimer/modules/main_screen/ui/widgets/deleting_background.dart';
import 'package:simpletimer/modules/main_screen/ui/widgets/timer_item/body.dart';
import 'package:simpletimer/widgets/dialogs/deleting_dialog.dart';
import 'package:simpletimer/widgets/nothing.dart';

import '../../../blocs/timer_list/exports.dart';
import 'header.dart';

class TimerItem extends StatelessWidget {
  final TimerModel timer;

  const TimerItem(this.timer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<String>("timer-item-${timer.uuid}"),
      direction: DismissDirection.endToStart,
      background: const DeletingBackground(),
      confirmDismiss: (DismissDirection direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return const DeletingDialog(
              title: Text("Delete this timer?"),
              body: Nothing(),
            );
          },
        );
      },
      onDismissed: (_) {
        context.read<TimerListBloc>().add(TimerListDeleteEvent(timer));
      },
      child: ExpandablePanel(
        header: TimerHeader(timer),
        collapsed: const Nothing(),
        expanded: TimerBody(timer),
        theme: const ExpandableThemeData(hasIcon: false),
      ),
    );
  }
}
