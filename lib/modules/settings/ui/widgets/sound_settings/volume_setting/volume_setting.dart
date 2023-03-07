import 'package:flutter/material.dart';

import '../../../../blocks/settings/exports.dart';
import '../../templates/setting_item.dart';
import '../../templates/simple_setting_item.dart';
import 'volume_slider.dart';

class VolumeSetting extends SettingItem {
  const VolumeSetting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previousState, state) {
        return previousState.playSoundOnLastThreeSeconds !=
            state.playSoundOnLastThreeSeconds;
      },
      builder: (context, state) {
        return SimpleSettingItem(
          title: "Volume",
          isActive: state.playSoundOnLastThreeSeconds,
          trailer: const Expanded(
            child: VolumeSlider(),
          ),
        );
      },
    );
  }
}
