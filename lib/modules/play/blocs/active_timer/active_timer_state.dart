part of 'active_timer_bloc.dart';

class ActiveTimerState extends Equatable {
  final TimerModel? timer;
  final TimerStatus timerStatus;
  final List<TimerStageModel> stages;
  final int stageIndex;

  const ActiveTimerState({
    this.timer,
    this.timerStatus = TimerStatus.ready,
    this.stages = const <TimerStageModel>[],
    this.stageIndex = 0,
  });

  @override
  List<Object> get props => [timer ?? Object(), timerStatus, stages];

  int get currentMinutes => stages.isEmpty ? 0 : stages[stageIndex].duration ~/ 60;

  int get currentSeconds => stages.isEmpty ? 0 : (stages[stageIndex].duration - (currentMinutes * 60));

  String get timerText => "${currentMinutes.beautifyForTime}:${currentSeconds.beautifyForTime}";

  TimerStageModel? get activeStage =>
      !stages.asMap().containsKey(stageIndex) ? null : stages[stageIndex];
  TimerStageModel? get nextStage =>
      !stages.asMap().containsKey(stageIndex + 1) ? null : stages[stageIndex + 1];

  double get progressPercent {
    if (timerStatus == TimerStatus.completed) return 100;
    if (stages.isEmpty) return 0;
    return (stageIndex) * 100 / stages.length;
  }

  int get stagesLeft => stages.isEmpty ? 0 : stages.length - (stageIndex);

  ActiveTimerState copyWith({
    TimerModel? timer,
    TimerStatus? timerStatus,
    List<TimerStageModel>? stages,
    int? stageIndex,
  }) {
    return ActiveTimerState(
      timer: timer ?? this.timer,
      timerStatus: timerStatus ?? this.timerStatus,
      stages: stages ?? this.stages,
      stageIndex: stageIndex ?? this.stageIndex,
    );
  }

  @override
  String toString() {
    return 'ActiveTimerState{timer: $timer, timerStatus: $timerStatus, stages: $stages, stageIndex: $stageIndex}';
  }
}
