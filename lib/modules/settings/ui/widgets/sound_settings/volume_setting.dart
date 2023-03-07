import 'package:flutter/material.dart';

import '../../../blocks/settings/exports.dart';
import '../templates/setting_item.dart';
import '../templates/simple_setting_item.dart';

class VolumeSetting extends SettingItem {
  final Axis axis;

  const VolumeSetting({
    Key? key,
    this.axis = Axis.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return SimpleSettingItem(
          title: "Volume",
          trailer: Slider(
            value: state.volume,
            onChanged: (value) {
              final event = ChangeVolumeSettingEvent(value);
              context.read<SettingsBloc>().add(event);
            },
            min: 0,
            max: 100,
          ),
        );
      },
    );
  }
}
