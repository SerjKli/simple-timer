abstract class AudioServiceContract {
  /// Play sound from assets folder
  void playFromAssets(String assetsPath);

  /// Play sound for each last three seconds during the countdown
  void playSoundOnTimerCountdown(int duration);
}
