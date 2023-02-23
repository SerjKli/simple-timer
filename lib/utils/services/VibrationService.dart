import 'package:flutter/services.dart';
import 'package:simpletimer/modules/settings/blocks/settings/exports.dart';
import 'package:simpletimer/route/NavigationService.dart';
import 'package:simpletimer/utils/services/LocatorService.dart';

class VibrationService {
  static void vibrate() {
    if (!vibrationAllowed()) return;

    //TODO: check vibration on a real device
    HapticFeedback.lightImpact();
  }

  //TODO: remove duplicate code with AudioplayersAudioServiceImpl _checkSettings
  static bool vibrationAllowed() {
    final settings = locator<NavigationService>()
        .navigatorKey
        .currentContext!
        .read<SettingsBloc>()
        .state;

    return settings.vibrationActive;
  }
}
