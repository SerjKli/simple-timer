abstract class AudioServiceContract {
  /// Determinate if implementation is requiring initialization before application is started
  final bool initializationRequired = false;

  /// Play sound from assets folder
  void playFromAssets(String assetsPath, [double volume = 1]);

  /// Initialization method
  void init();
}
