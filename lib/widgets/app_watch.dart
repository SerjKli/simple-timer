import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';

class AppWatch extends StatelessWidget {
  const AppWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(120)),
          child: Container(
            width: constraints.maxHeight,
            height: constraints.maxHeight,
            color: context.colorScheme.brand,
          ),
        );
      },
    );
  }
}
