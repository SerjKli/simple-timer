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
