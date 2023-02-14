part of 'timer_list_bloc.dart';

// abstract class TimerListState extends Equatable {
//   const TimerListState();
// }

class TimerListState extends Equatable {
  final List<TimerModel> timers;

  const TimerListState({this.timers = const <TimerModel>[]});

  @override
  List<Object> get props => [timers];

  List<TimerModel> get allTimers => timers;
  int get timersLength => allTimers.length;
  bool get isEmpty => timersLength == 0;
}
