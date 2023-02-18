import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';

import 'buttons/left_button.dart';
import 'buttons/right_button.dart';
import 'current_progress.dart';

class Bottom extends StatelessWidget {
  static const double topPartHeightFactor = 0.65;
  static const double bottomPartHeightFactor = 0.35;

  const Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: constraints.maxHeight - UiValues.buttonHeight,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: const [
                Expanded(
                  child: LeftButton(),
                ),
                Expanded(
                  child: RightButton(),
                ),
              ],
            ),
          ),
          const CurrentProgress(),
        ],
      );
    });
  }
}
