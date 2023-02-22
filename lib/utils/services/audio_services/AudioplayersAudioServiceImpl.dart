import 'package:audioplayers/audioplayers.dart';
import 'package:simpletimer/modules/settings/blocks/settings/exports.dart';
import 'package:simpletimer/route/NavigationService.dart';
import 'package:simpletimer/utils/services/LocatorService.dart';
import 'package:simpletimer/utils/services/audio_services/AudioServiceContract.dart';

class AudioplayersAudioServiceImpl implements AudioServiceContract {
  final AudioPlayer player;
  SettingsState settings = const SettingsState();

  AudioplayersAudioServiceImpl(this.player) {
    settings = locator<NavigationService>()
        .navigatorKey
        .currentContext!
        .read<SettingsBloc>()
        .state;
  }

  bool get isSoundOff => settings.playSoundOnLastThreeSeconds == false;

  @override
  void playFromAssets(String assetsPath) async {
    await player.play(AssetSource(assetsPath));
  }

  @override
  void playSoundOnTimerCountdown(int duration) {
    if (duration > 3) return;
    if (isSoundOff) return;

    final String sound = _getSoundFileNameByDurationAndSetting(duration);

    playFromAssets(sound);
  }

  String _getSoundFileNameByDurationAndSetting(int duration) {
    String fileName;
    String fileNameSuffix;

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
