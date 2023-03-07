import 'package:flutter/material.dart';
import 'package:simpletimer/widgets/app_screen.dart';

import 'widgets/about_settings.dart';
import 'widgets/interface_settings.dart';
import 'widgets/skin_settings/skin_settings.dart';
import 'widgets/sound_settings/sound_settings.dart';
import 'widgets/vibration_settings.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      screenTitle: "Settings",
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SkinSettings(),
            InterfaceSettings(),
            SoundSettings(),
            VibrationSettings(),
            AboutSettings(),
          ],
        ),
      ),
    );
  }
}
