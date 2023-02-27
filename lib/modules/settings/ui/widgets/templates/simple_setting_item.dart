import 'package:flutter/material.dart';
import 'package:simpletimer/modules/settings/ui/widgets/templates/setting_item.dart';
import 'package:simpletimer/utils/extensions/beatify.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_text.dart';

class SimpleSettingItem extends SettingItem {
  final dynamic title;
  final Widget trailer;
  final bool withTopPadding;
  final bool isActive;

  const SimpleSettingItem({
    Key? key,
    required this.title,
    required this.trailer,
    this.withTopPadding = false,
    this.isActive = true,
  })  : assert(title is String || title is Widget),
        super(key: key);

  Widget get titleElement => (title is String)
      ? Padding(
          padding: withTopPadding
              ? const EdgeInsets.only(top: UiValues.padding2x)
              : const EdgeInsets.all(0),
          child: AppText(title),
        )
      : title;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: UiValues.animationSpeed.toMillisecondsDuration,
      opacity: isActive ? 1 : 0.5,
      child: IgnorePointer(
        ignoring: !isActive,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: UiValues.padding2x),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: titleElement),
              trailer,
            ],
          ),
        ),
      ),
    );
  }
}
