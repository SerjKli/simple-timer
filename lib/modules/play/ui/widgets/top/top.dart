import 'package:flutter/material.dart';
import 'package:simpletimer/widgets/app_watch.dart';

import 'timer_status_title.dart';
import 'timer_tick.dart';

class Top extends StatelessWidget {
  const Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          TimerStatusTitle(),
          SizedBox(
            height: 280, //TODO: remove static height
            child: AppWatch(),
          ),
          TimerTik(),
          // TestTimer(),
        ],
      ),
    );
  }
}
