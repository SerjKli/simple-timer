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
