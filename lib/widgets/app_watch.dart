import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';

class AppWatch extends StatelessWidget {
  const AppWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(120)),
      child: Container(
        width: 240,
        height: 240,
        color: context.colorScheme.brand,
      ),
    );
  }
}
