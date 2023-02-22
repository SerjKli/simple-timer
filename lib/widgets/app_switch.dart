import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';

class AppSwitch extends StatelessWidget {
  final bool value;
  final Function(bool)? onChanged;

  const AppSwitch({
    Key? key,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: Move theming in ThemeService

    return Switch.adaptive(
      value: value,
      onChanged: onChanged,
      activeColor: context.colorScheme.brand,
    );
  }
}
