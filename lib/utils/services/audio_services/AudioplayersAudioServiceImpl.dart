import 'package:audioplayers/audioplayers.dart';
import 'package:simpletimer/utils/services/audio_services/AudioServiceContract.dart';

class AudioplayersAudioServiceImpl implements AudioServiceContract {
  final AudioPlayer player;

  AudioplayersAudioServiceImpl(this.player);

  @override
  void playFromAssets(String assetsPath) async {
    if (player.state == PlayerState.playing) {
      await player.stop();
    }

    await player.play(
      AssetSource(assetsPath),
      volume: 1,
    );
  }

  @override
  void playSoundOnTimerCountdown(int duration) {
    if (duration > 3) return;
    // if (isSoundOff) return;

    final String sound = _getSoundFileNameByDurationAndSetting(duration);

    playFromAssets(sound);
  }

  String _getSoundFileNameByDurationAndSetting(int duration) {
    // String fileName;
    // String fileNameSuffix;
    //
    // switch (settings.soundName) {
    //   case 'base':
    //     fileName = "base";
    //     break;
    //   case 'race':
    //     fileName = "race";
    //     break;
    //   default:
    //     fileName = "base";
    // }
    //
    // fileNameSuffix = duration <= 3 && duration >= 1 ? '' : '_finish';
    return 'audio/timer_sounds/base.wav';

    // return 'audio/timer_sounds/$fileName$fileNameSuffix.wav';
  }
}
