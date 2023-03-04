import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:simpletimer/utils/services/audio_services/AudioServiceContract.dart';

class AudioplayersAudioServiceImpl implements AudioServiceContract {
  final AudioPlayer player;

  @override
  bool get initializationRequired => true;

  AudioplayersAudioServiceImpl(this.player);

  @override
  init() {
    debugPrint("audioplayers init"); //TODO: remove debugging
    const AudioContext audioContext = AudioContext(
      iOS: AudioContextIOS(
        // defaultToSpeaker: true,
        category: AVAudioSessionCategory.playback,
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

    await player.setVolume(1);

    await player.play(
      AssetSource(assetsPath),
      volume: 1,
      mode: PlayerMode.lowLatency,
    );
  }
}
