import 'package:flutter/material.dart';
import 'package:simpletimer/widgets/watch_skins/candles/active_status_view.dart';
import 'package:simpletimer/widgets/watch_skins/candles/inactive_status_view.dart';

import '../watch_skin.dart';

class CandlesSkin extends WatchSkin {
  static const String skinName = 'candles';
  final bool isActive;
  final Widget? child;

  const CandlesSkin({
    Key? key,
    this.child,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        child: isActive ? const ActiveStatusView() : InactiveStatusView(child),
      );
    });
  }
}
