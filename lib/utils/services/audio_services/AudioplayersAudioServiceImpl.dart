import 'package:audioplayers/audioplayers.dart';
import 'package:simpletimer/utils/services/audio_services/AudioServiceContract.dart';

class AudioplayersAudioServiceImpl implements AudioServiceContract {
  final AudioPlayer player;

  @override
  bool get initializationRequired => true;

  AudioplayersAudioServiceImpl(this.player);

  @override
  init() {
    const AudioContext audioContext = AudioContext(
      iOS: AudioContextIOS(
        // defaultToSpeaker: true,
        category: AVAudioSessionCategory.ambient,
        options: [
          AVAudioSessionOptions.defaultToSpeaker,
          AVAudioSessionOptions.mixWithOthers,
        ],
      ),
      android: AudioContextAndroid(
        isSpeakerphoneOn: true,
        stayAwake: true,
        contentType: AndroidContentType.sonification,
        usageType: AndroidUsageType.assistanceSonification,
        // audioFocus: AndroidAudioFocus.none,
      ),
    );

    AudioPlayer.global.setGlobalAudioContext(audioContext);
  }

  @override
  void playFromAssets(String assetsPath) async {
    if (player.state == PlayerState.playing) {
      await player.stop();
    }

    await player.play(
      AssetSource(assetsPath),
      // volume: 1,
      // mode: PlayerMode.lowLatency,
    );
  }
}
