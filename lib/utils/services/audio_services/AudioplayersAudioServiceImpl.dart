import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:simpletimer/modules/settings/blocks/settings/exports.dart';
import 'package:simpletimer/route/NavigationService.dart';
import 'package:simpletimer/utils/services/LocatorService.dart';
import 'package:simpletimer/utils/services/audio_services/AudioServiceContract.dart';

class AudioplayersAudioServiceImpl implements AudioServiceContract {
  final AudioPlayer player;
  SettingsState settings = const SettingsState();

  AudioplayersAudioServiceImpl(this.player) {
    _checkSettings();
  }

  _checkSettings() {
    settings = locator<NavigationService>()
        .navigatorKey
        .currentContext!
        .read<SettingsBloc>()
        .state;
  }

  bool get isSoundOff => settings.playSoundOnLastThreeSeconds == false;

  @override
  void playFromAssets(String assetsPath) async {
    //TODO: replace method with bloc state change listener
    _checkSettings();
    await player.play(AssetSource(assetsPath));
  }

  @override
  void playSoundOnTimerCountdown(int duration) {
    if (duration > 3) return;
    if (isSoundOff) return;

    //TODO: replace method with bloc state change listener
    _checkSettings();

    final String sound = _getSoundFileNameByDurationAndSetting(duration);

    playFromAssets(sound);
  }

  String _getSoundFileNameByDurationAndSetting(int duration) {
    String fileName;
    String fileNameSuffix;
    debugPrint("${settings.soundName}"); //TODO: remove debugging
    switch (settings.soundName) {
      case 'base':
        fileName = "base";
        break;
      case 'race':
        fileName = "race";
        break;
      default:
        fileName = "base";
    }

    fileNameSuffix = duration <= 3 && duration >= 1 ? '' : '_finish';

    return 'audio/timer_sounds/$fileName$fileNameSuffix.wav';
  }
}
