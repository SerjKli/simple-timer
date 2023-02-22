import 'package:flutter/material.dart';
import 'package:simpletimer/widgets/app_text.dart';

import 'templates/setting_group.dart';
import 'templates/simple_setting_item.dart';

class SoundSettings extends StatelessWidget {
  const SoundSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingGroup(
      title: 'Sound',
      items: [
        SimpleSettingItem(
          title: "Play sound on last 3 seconds of timer",
          trailer: Switch.adaptive(
            value: false,
            onChanged: (value) {},
          ),
        ),
        //TODO: implement
        const SimpleSettingItem(
          title: "Track",
          trailer: AppText('choose...'),
        ),
      ],
    );
  }
}
