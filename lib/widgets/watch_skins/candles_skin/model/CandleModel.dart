import 'package:equatable/equatable.dart';
import 'package:simpletimer/modules/play/models/TimerStageModel.dart';
import 'package:simpletimer/utils/enums/TimerStatus.dart';

class CandleModel extends Equatable {
  final TimerStatus status;
  final int totalSeconds;
  final int secondsRemaining;
  final bool isActive;

  const CandleModel({
    required this.status,
    required this.totalSeconds,
    required this.secondsRemaining,
    required this.isActive,
  });

  double get percentRemaining => secondsRemaining * 100 / totalSeconds;

  @override
  List<Object?> get props => [status, totalSeconds, secondsRemaining, isActive];

  CandleModel copyWith({
    TimerStatus? status,
    int? totalSeconds,
    int? secondsRemaining,
    bool? isActive,
  }) {
    return CandleModel(
      status: status ?? this.status,
      totalSeconds: totalSeconds ?? this.totalSeconds,
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
      isActive: isActive ?? this.isActive,
    );
  }

  factory CandleModel.fromTimerStageModel({
    required TimerStageModel timerStage,
    required int secondsRemaining,
    required bool isActive,
  }) {
    return CandleModel(
      status: timerStage.status,
      totalSeconds: timerStage.duration,
      secondsRemaining: secondsRemaining,
      isActive: isActive,
    );
  }

  @override
  String toString() {
    return 'CandleModel{status: $status, totalSeconds: $totalSeconds, secondsRemaining: $secondsRemaining, isActive: $isActive}';
  }
}
