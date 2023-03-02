import 'package:equatable/equatable.dart';
import 'package:simpletimer/modules/play/models/TimerStageModel.dart';
import 'package:simpletimer/utils/enums/TimerStatus.dart';

class CandleModel extends Equatable {
  final TimerStatus status;
  final int totalSeconds;
  final int secondsPast;
  final bool isActive;

  const CandleModel({
    required this.status,
    required this.totalSeconds,
    required this.secondsPast,
    required this.isActive,
  });

  int get secondsRemaining => totalSeconds - secondsPast;
  double get percentRemaining => secondsRemaining * 100 / totalSeconds;

  @override
  List<Object?> get props => [status, totalSeconds, secondsPast, isActive];

  CandleModel copyWith({
    TimerStatus? status,
    int? totalSeconds,
    int? secondsPast,
    bool? isActive,
  }) {
    return CandleModel(
      status: status ?? this.status,
      totalSeconds: totalSeconds ?? this.totalSeconds,
      secondsPast: secondsPast ?? this.secondsPast,
      isActive: isActive ?? this.isActive,
    );
  }

  factory CandleModel.fromTimerStageModel({
    required TimerStageModel timerStage,
    required int secondsPast,
    required bool isActive,
  }) {
    return CandleModel(
      status: timerStage.status,
      totalSeconds: timerStage.duration,
      secondsPast: secondsPast,
      isActive: isActive,
    );
  }
}
