import 'package:flutter/material.dart';

abstract class UiValues {
  static const double elevation = 0;

  static const double padding = 8;
  static const double padding2x = 16;
  static const double paddingMax = 24;

  static const EdgeInsets paddingEdge = EdgeInsets.all(padding);
  static const EdgeInsets paddingEdgeLg = EdgeInsets.all(padding2x);
  static const EdgeInsets paddingEdgeMax = EdgeInsets.all(paddingMax);

  static const int animationSpeed = 300;
  static const Duration animationDuration = Duration(
    milliseconds: animationSpeed,
  );
  static const Duration animationDuration2x = Duration(
    milliseconds: animationSpeed ~/ 2,
  );

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

  static BoxBorder get borderTest => Border.all(color: Colors.black);

  /// UI elements sizes
  static const double buttonHeight = 88;
  static const double iconButtonSize = 56;
  static const double timeBoxWidth = 60;
}
