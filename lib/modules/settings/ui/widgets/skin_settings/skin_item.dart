import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';

class SkinItem extends StatelessWidget {
  final Widget child;
  const SkinItem({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.symmetric(vertical: UiValues.padding2x),
      child: child,
    );
  }
}
