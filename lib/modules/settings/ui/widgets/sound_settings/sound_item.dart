import 'package:flutter/material.dart';
import 'package:simpletimer/widgets/app_text.dart';

import '../../../blocks/settings/exports.dart';

class SoundItem extends StatelessWidget {
  final String value;
  final Function(Object?) onChanged;

  const SoundItem({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return RadioListTile(
          value: value,
          groupValue: 1,
          title: AppText(value),
          onChanged: onChanged,
          // activeColor: Colors.red,
          selected: state.soundName == value,
        );
      },
    );
  }
}
