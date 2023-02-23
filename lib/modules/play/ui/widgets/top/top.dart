import 'package:flutter/material.dart';
import 'package:simpletimer/widgets/app_watch.dart';

import 'timer_status_title.dart';

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
          Expanded(
            child: AppWatch(isActive: true),
          ),
        ],
      ),
    );
  }
}
