part of 'workout_list_bloc.dart';

// abstract class TimerListState extends Equatable {
//   const TimerListState();
// }

class WorkoutListState extends Equatable {
  final List<WorkoutModel> timers;

  const WorkoutListState({this.timers = const <WorkoutModel>[]});

  @override
  List<Object> get props => [timers];

  List<WorkoutModel> get allTimers => timers;
  int get timersLength => allTimers.length;
  bool get isEmpty => timersLength == 0;
}
