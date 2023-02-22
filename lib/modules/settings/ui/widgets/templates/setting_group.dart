import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_text.dart';

import 'setting_item.dart';

class SettingGroup extends StatelessWidget {
  final String title;
  final List<SettingItem> items;

  const SettingGroup({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiValues.paddingEdgeMax,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText.h1(
            title.toUpperCase(),
          ),
          Column(
            children: [
              ...items,
            ],
          )
        ],
      ),
    );
  }
}
