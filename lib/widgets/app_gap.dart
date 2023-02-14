import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';

class AppGap extends StatelessWidget {
  final double width;
  final double height;
  const AppGap({
    Key? key,
    this.width = 0.0,
    this.height = 0.0,
  }) : super(key: key);

  const AppGap.vertical({
    super.key,
    this.height = 0,
  }) : width = UiValues.padding2x;

  const AppGap.horizontal({
    super.key,
    this.width = 0,
  }) : height = UiValues.padding2x;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
