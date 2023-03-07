import 'package:flutter/material.dart';

import '../../../../blocks/settings/exports.dart';

class VolumeSlider extends StatelessWidget {
  const VolumeSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Slider.adaptive(
          value: state.volume,
          onChanged: (value) {
            final event = ChangeVolumeSettingEvent(value);
            context.read<SettingsBloc>().add(event);
          },
          min: 0,
          max: 100,
        );
      },
    );
  }
}
