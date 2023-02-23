import 'package:flutter/material.dart';
import 'package:simpletimer/modules/settings/ui/widgets/templates/setting_group.dart';
import 'package:simpletimer/modules/settings/ui/widgets/templates/simple_setting_item.dart';
import 'package:simpletimer/widgets/app_switch.dart';

import '../../blocks/settings/exports.dart';

class VibrationSettings extends StatelessWidget {
  const VibrationSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingGroup(
      title: "Vibration",
      items: [
        SimpleSettingItem(
          title: 'Vibrate on buttons',
          trailer: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              return AppSwitch(
                value: state.vibrationActive,
                onChanged: (value) {
                  const event = ChangeVibrationActiveStatusSettingEvent();
                  context.read<SettingsBloc>().add(event);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
