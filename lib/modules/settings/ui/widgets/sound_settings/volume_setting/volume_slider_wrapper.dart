import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';

class VolumeSliderWrapper extends StatelessWidget {
  static const double wrapperHeight = UiValues.iconButtonSize;
  final double topOffset;
  final Widget child;

  double _getWrapperWidth(BuildContext context) {
    return MediaQuery.of(context).size.width - (UiValues.iconButtonSize * 2);
  }

  const VolumeSliderWrapper(
    this.topOffset, {
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: topOffset,
        right: UiValues.iconButtonSize,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: UiValues.paddingMax,
      ),
      width: _getWrapperWidth(context),
      height: wrapperHeight,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: UiValues.shadowOffset,
            blurRadius: UiValues.shadowBlur,
            color: context.colorScheme.shadow!.withOpacity(0.4),
          )
        ],
        color: context.colorScheme.bg,
        borderRadius: const BorderRadius.all(
          Radius.circular(wrapperHeight),
        ),
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
