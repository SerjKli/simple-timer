import 'package:simpletimer/utils/enums/TimerStatus.dart';

class TimerStageModel {
  final int duration;
  final TimerStatus status;

  TimerStageModel({
    required this.duration,
    required this.status,
  });

  @override
  String toString() {
    return 'TimerStageModel {duration: $duration, status: $status}';
  }
}
