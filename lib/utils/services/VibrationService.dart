import 'dart:io';

import 'package:flutter/services.dart';
import 'package:simpletimer/modules/settings/blocks/settings/exports.dart';
import 'package:simpletimer/route/NavigationService.dart';
import 'package:simpletimer/utils/services/LocatorService.dart';
import 'package:vibration/vibration.dart';

class VibrationService {
  static void vibrate() async {
    if (!_vibrationAllowed()) return;

    if (Platform.isAndroid) {
      Vibration.vibrate(duration: 60);
    } else {
      HapticFeedback.lightImpact();
    }
  }

  //TODO: remove duplicate code with AudioplayersAudioServiceImpl _checkSettings
  static bool _vibrationAllowed() {
    final settings = locator<NavigationService>()
        .navigatorKey
        .currentContext!
        .read<SettingsBloc>()
        .state;

    return settings.vibrationActive;
  }
}
