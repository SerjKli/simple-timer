import 'package:audioplayers/audioplayers.dart';
import 'package:simpletimer/utils/services/audio_services/AudioServiceContract.dart';

class AudioplayersAudioServiceImpl implements AudioServiceContract {
  final AudioPlayer player;

  @override
  bool get initializationRequired => true;

  AudioplayersAudioServiceImpl(this.player);

  @override
  init() {
    AudioContext audioContext = AudioContext(
      iOS: AudioContextIOS(
        // defaultToSpeaker: true,
        category: AVAudioSessionCategory.playAndRecord,
        options: const {
          AVAudioSessionOptions.defaultToSpeaker,
          AVAudioSessionOptions.mixWithOthers,
        },
      ),
      android: const AudioContextAndroid(
        // isSpeakerphoneOn: true,
        stayAwake: true,
        contentType: AndroidContentType.sonification,
        usageType: AndroidUsageType.assistanceSonification,
        audioFocus: AndroidAudioFocus.gain,
      ),
    );

    AudioPlayer.global.setAudioContext(audioContext);
  }

  @override
  void playFromAssets(String assetsPath, [double volume = 1]) async {
    if (player.state == PlayerState.playing) {
      await player.stop();
    }

    if (volume < 0) volume = 0;
    if (volume > 1) volume = volume / 100;

    await player.play(
      AssetSource(assetsPath),
      volume: volume,
      // mode: PlayerMode.lowLatency,
    );
  }
}
