import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';

import 'app_text.dart';

class AppWatch extends StatelessWidget {
  const AppWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(constraints.maxHeight / 2),
          ),
          child: Container(
            width: constraints.maxHeight,
            height: constraints.maxHeight,
            color: context.colorScheme.brand,
            child: const Align(
              alignment: Alignment.center,
              child: AppText.dark("i'm THE SUN"),
            ),
          ),
        );
      },
    );
  }
}
