import '../enums/TimerStatus.dart';

extension BeatufyTimerStatus on TimerStatus {
  String getTitle() {
    switch (this) {
      case TimerStatus.ready:
        return "Ready?";
      case TimerStatus.workout:
        return "Workout";
      case TimerStatus.rest:
        return "Rest";
      case TimerStatus.preparing:
        return "Get ready...";
      case TimerStatus.pause:
        return "Take a deep breath";
      case TimerStatus.completed:
        return "Done!";
      default:
        return "ooops";
    }
  }
}
