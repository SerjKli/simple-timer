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
}
