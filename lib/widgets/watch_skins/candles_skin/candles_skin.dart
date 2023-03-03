import 'package:flutter/material.dart';

import '../watch_skin.dart';
import 'active_status_view.dart';
import 'inactive_status_view.dart';

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
