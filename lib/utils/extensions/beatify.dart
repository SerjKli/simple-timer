extension AppIntExtension on int {
  String get beautifyForTime => toString().padLeft(2, "0");
}

extension AppStringExtension on String {
  String get beautifyForTime => padLeft(2, "0");
}