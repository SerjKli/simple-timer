import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_gap.dart';
import 'package:simpletimer/widgets/app_text.dart';

class StatisticItem extends StatelessWidget {
  final String title;
  final int value;

  const StatisticItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiValues.paddingEdgeMax,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText.max(title),
          const AppGap.vertical(),
          AppText.h1(value.toString()),
        ],
      ),
    );
  }
}
