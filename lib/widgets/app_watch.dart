import 'package:flutter/material.dart';

import 'watch_skins/digital_base_skin/digital_base_skin.dart';

class AppWatch extends StatelessWidget {
  final bool isActive;
  final Widget? child;

  const AppWatch({
    Key? key,
    this.child,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return BasicSkin(isActive: isActive, child: child);
    return DigitalBaseSkin(isActive: isActive, child: child);
  }
}
