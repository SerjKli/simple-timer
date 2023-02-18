import 'package:simpletimer/modules/play/enums/TimerStatus.dart';

class DurationModel {
  final int duration;
  final TimerStatus status;

  DurationModel({
    required this.duration,
    required this.status,
  });

  @override
  String toString() {
    return 'DurationModel{duration: $duration, status: $status}';
  }
}
