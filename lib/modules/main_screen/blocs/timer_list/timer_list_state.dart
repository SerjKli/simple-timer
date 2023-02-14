part of 'timer_list_bloc.dart';

abstract class TimerListState extends Equatable {
  const TimerListState();
}

class TimerListInitial extends TimerListState {
  final List<TimerModel> timers;

  const TimerListInitial({this.timers = const []});

  @override
  List<Object> get props => [];

  List<TimerModel> get allTimers => timers;
}
