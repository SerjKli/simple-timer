import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/widgets/app_screen.dart';

import 'widgets/about_settings.dart';
import 'widgets/skin_settings/skin_settings.dart';
import 'widgets/sound_settings.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      screenTitle: "Settings",
      titleIcon: FontAwesomeIcons.gear,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SoundSettings(),
            SkinSettings(),
            AboutSettings(),
          ],
        ),
      ),
    );
  }
}
