extension IntX on int {
  String get beautifyForTime => toString().padLeft(2, "0");

  String timeFromDuration() {
    final int minutes = this ~/ 60;
    final int seconds = this - (minutes * 60);

    return "${minutes.beautifyForTime}:${seconds.beautifyForTime}";
  }

  Duration get toSecondsDuration => Duration(seconds: this);
  Duration get toMillisecondsDuration => Duration(milliseconds: this);
}

extension StringX on String {
  String get beautifyForTime => padLeft(2, "0");
}

extension EnumX on Enum {
  String toShortString() {
    return toString().split('.').last;
  }
}
