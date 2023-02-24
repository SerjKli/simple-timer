part of 'active_timer_bloc.dart';

abstract class ActiveTimerEvent extends Equatable {
  const ActiveTimerEvent();
}

class ChooseTimerEvent extends ActiveTimerEvent {
  final TimerModel timer;

  const ChooseTimerEvent(this.timer);

  @override
  List<Object> get props => [timer];
}

class StartTimerEvent extends ActiveTimerEvent {
  const StartTimerEvent();

  @override
  List<Object> get props => [];
}

class ExitTimerEvent extends ActiveTimerEvent {
  const ExitTimerEvent();

  @override
  List<Object> get props => [];
}

class PauseTimerEvent extends ActiveTimerEvent {
  const PauseTimerEvent();

  @override
  List<Object> get props => [];
}

class RestartTimerEvent extends ActiveTimerEvent {
  const RestartTimerEvent();

  @override
  List<Object> get props => [];
}

class ContinuePausedTimerEvent extends ActiveTimerEvent {
  const ContinuePausedTimerEvent();

  @override
  List<Object> get props => [];
}

class SkipCurrentDurationEvent extends ActiveTimerEvent {
  const SkipCurrentDurationEvent();

  @override
  List<Object> get props => [];
}

class TimerGestureActivityEvent extends ActiveTimerEvent {
  final GestureActivity activity;
  const TimerGestureActivityEvent(this.activity);

  @override
  List<Object> get props => [];
}
