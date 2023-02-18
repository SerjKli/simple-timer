part of 'active_timer_bloc.dart';

class ActiveTimerState extends Equatable {
  final TimerModel? timer;
  final TimerStatus timerStatus;
  final Timer? periodicTimer;
  final List<DurationModel> durations;

  const ActiveTimerState({
    this.timer,
    this.timerStatus = TimerStatus.ready,
    this.periodicTimer,
    this.durations = const <DurationModel>[],
  });

  @override
  List<Object> get props =>
      [timer ?? Object(), timerStatus, periodicTimer ?? Object()];

  ActiveTimerState copyWith({
    TimerModel? timer,
    TimerStatus? timerStatus,
    Timer? periodicTimer,
    List<DurationModel>? durations,
  }) {
    return ActiveTimerState(
      timer: timer ?? this.timer,
      timerStatus: timerStatus ?? this.timerStatus,
      periodicTimer: periodicTimer ?? this.periodicTimer,
      durations: durations ?? this.durations,
    );
  }
}
