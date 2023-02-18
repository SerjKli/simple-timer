import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_text.dart';

class CurrentProgress extends StatelessWidget {
  const CurrentProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: UiValues.buttonHeight,
      width: double.infinity,
      color: context.colorScheme.brand,
      child: const Center(child: AppText.dark('current progress...')),
    );
  }
}
