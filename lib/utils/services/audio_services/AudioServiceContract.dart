abstract class AudioServiceContract {
  /// Determinate if implementation is requiring initialization before application is started
  final bool initializationRequired = false;

  /// Play sound from assets folder
  void playFromAssets(String assetsPath);

  /// Initialization method
  void init();
}
