import 'package:flutter/material.dart';
import 'package:simpletimer/route/NavigationService.dart';
import 'package:simpletimer/utils/services/LocatorService.dart';
import 'package:simpletimer/widgets/app_icon.dart';

import '../settings_screen.dart';

class ToSettingsPageButton extends StatelessWidget {
  const ToSettingsPageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        locator<NavigationService>().pushNamed(SettingsScreen.routeName);
      },
      icon: const AppIcon(icon: Icons.settings),
    );
  }
}
