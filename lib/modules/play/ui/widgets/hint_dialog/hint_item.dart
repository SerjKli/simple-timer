import 'package:flutter/material.dart';
import 'package:simpletimer/widgets/app_gap.dart';
import 'package:simpletimer/widgets/app_text.dart';

class HintItem extends StatelessWidget {
  final String action;
  final String caption;

  const HintItem({
    Key? key,
    required this.action,
    required this.caption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText.brand(
          action,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const AppGap.horizontal(),
        Expanded(child: AppText(caption, textAlign: TextAlign.end)),
      ],
    );
  }
}
