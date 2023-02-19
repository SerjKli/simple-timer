part of 'active_timer_bloc.dart';

class ActiveTimerState extends Equatable {
  final TimerModel? timer;
  final TimerStatus timerStatus;
  final List<DurationModel> durations;

  const ActiveTimerState({
    this.timer,
    this.timerStatus = TimerStatus.ready,
    this.durations = const <DurationModel>[],
  });

  @override
  List<Object> get props => [timer ?? Object(), timerStatus, durations];

  int get currentMinutes => durations.isEmpty ? 0 : durations[0].duration ~/ 60;

  int get currentSeconds =>
      durations.isEmpty ? 0 : (durations[0].duration - (currentMinutes * 60));

  String get timerText =>
      "${currentMinutes.beautifyForTime}:${currentSeconds.beautifyForTime}";

  DurationModel? get activeDuration => durations.isEmpty ? null : durations[0];

  double get remainingProgressPercent =>
      timer == null || timerStatus == TimerStatus.ready
          ? 100
          : (durations.length * 100 / timer!.totalStagesCount);
  double get progressPercent => 100 - remainingProgressPercent;

  ActiveTimerState copyWith({
    TimerModel? timer,
    TimerStatus? timerStatus,
    List<DurationModel>? durations,
    int? elapsedSeconds,
  }) {
    return ActiveTimerState(
      timer: timer ?? this.timer,
      timerStatus: timerStatus ?? this.timerStatus,
      durations: durations ?? this.durations,
    );
  }
}
