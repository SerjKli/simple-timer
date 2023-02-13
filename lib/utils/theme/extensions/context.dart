import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/color_schema.dart';

extension AppColorSchemeExtension on BuildContext {
  AppColorScheme get colorScheme => Theme.of(this).extension<AppColorScheme>()!;
}
