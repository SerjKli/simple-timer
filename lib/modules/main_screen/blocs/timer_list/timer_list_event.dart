part of 'timer_list_bloc.dart';

abstract class TimerListEvent extends Equatable {
  const TimerListEvent();
}

class TimerListAddEvent extends TimerListEvent {
  final TimerModel timer;

  const TimerListAddEvent(this.timer);

  @override
  List<Object> get props => [timer];
}

class TimerListEditEvent extends TimerListEvent {
  final TimerModel timer;

  const TimerListEditEvent(this.timer);

  @override
  List<Object> get props => [timer];
}

class TimerListDeleteEvent extends TimerListEvent {
  final TimerModel timer;

  const TimerListDeleteEvent(this.timer);

  @override
  List<Object> get props => [timer];
}
