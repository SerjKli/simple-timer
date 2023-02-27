import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/utils/extensions/beatify.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_gap.dart';
import 'package:simpletimer/widgets/app_icon.dart';
import 'package:simpletimer/widgets/app_text.dart';

class EmptyTimerList extends StatefulWidget {
  const EmptyTimerList({Key? key}) : super(key: key);

  @override
  State<EmptyTimerList> createState() => _EmptyTimerListState();
}

class _EmptyTimerListState extends State<EmptyTimerList> {
  double opacity = 0;

  @override
  void initState() {
    Timer(Duration.zero, () {
      opacity = 1;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: UiValues.animationSpeed2x.toMillisecondsDuration,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          AppIcon.lg(icon: FontAwesomeIcons.listUl),
          AppGap.vertical(),
          AppText("Ready to add a new timer?"),
        ],
      ),
    );
  }
}
