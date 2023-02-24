import 'package:flutter/material.dart';
import 'package:simpletimer/modules/settings/blocks/settings/exports.dart';
import 'package:simpletimer/widgets/watch_skins/digital_base_skin/digital_base_skin.dart';

import 'watch_skins/basic_skin/basic_skin.dart';

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
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        switch (state.skinName) {
          case BasicSkin.skinName:
            return BasicSkin(
              isActive: isActive,
              child: child,
            );
          case DigitalBaseSkin.skinName:
            return DigitalBaseSkin(
              isActive: isActive,
              child: child,
            );
          default:
            return BasicSkin(isActive: isActive, child: child);
        }
      },
    );
  }
}
