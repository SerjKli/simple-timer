import 'package:flutter/material.dart';
import 'package:simpletimer/widgets/app_text.dart';

import 'templates/setting_group.dart';
import 'templates/simple_setting_item.dart';

class AboutSettings extends StatelessWidget {
  const AboutSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SettingGroup(
      title: 'About',
      items: [
        SimpleSettingItem(
          title: "Version",
          withTopPadding: true,
          //TODO: remove static version
          trailer: AppText('v 1.0.0'),
        ),
        SimpleSettingItem(
          title: "Created by",
          //TODO: add link to a website
          trailer: AppText('SimpleAppsOk'),
        ),
      ],
    );
  }
}
