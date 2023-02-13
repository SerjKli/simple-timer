import 'package:flutter/material.dart';

abstract class UiValues {
  static const double elevation = 0;

  static const double padding = 8;
  static const double padding2x = 16;

  static const int animationSpeed = 300;

  static const Radius radius = Radius.circular(8);
  static const Radius radius2x = Radius.circular(16);
  static const Radius radiusBig = Radius.circular(120);

  static const double radiusVal = 8;
  static const double radius2xVal = 16;
  static const double radiusBigVal = 120;

  static const Offset shadowOffset = Offset(4, 4);
  static const double shadowBlur = 8.0;

  static const double opacity = 0.4;

  static BoxShadow defShadow = const BoxShadow(
    blurRadius: shadowBlur,
    offset: shadowOffset,
  );
}
