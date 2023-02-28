import 'package:flutter/material.dart';
import 'package:simpletimer/widgets/app_switch.dart';

import '../../blocks/settings/exports.dart';
import 'templates/setting_group.dart';
import 'templates/simple_setting_item.dart';

class InterfaceSettings extends StatelessWidget {
  const InterfaceSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingGroup(
      title: 'Interface',
      items: [
        SimpleSettingItem(
          title: "Show background color on active timer",
          trailer: BlocBuilder<SettingsBloc, SettingsState>(
            buildWhen: (previousState, state) {
              return previousState.showBackgroundForActiveTimer !=
                  state.showBackgroundForActiveTimer;
            },
            builder: (context, state) {
              return AppSwitch(
                value: state.showBackgroundForActiveTimer,
                onChanged: (value) {
                  const event = ChangeBackgroundDisplayingEvent();
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
