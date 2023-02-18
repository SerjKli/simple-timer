import 'package:flutter/cupertino.dart';

import '../enums/ButtonSize.dart';
import '../theme/ui_values.dart';

extension AppButtonExtension on ButtonSize {
  Size? getSize() {
    switch (this) {
      case ButtonSize.xs:
      case ButtonSize.sm:
      case ButtonSize.m:
        return null;
      case ButtonSize.lg:
        return const Size(
          double.infinity,
          UiValues.buttonHeight,
        );
      case ButtonSize.flex:
        return const Size(
          double.infinity,
          double.infinity,
        );
      default:
        return null;
    }
  }
}
