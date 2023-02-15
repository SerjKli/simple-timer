part of 'workout_list_bloc.dart';

abstract class WorkoutListEvent extends Equatable {
  const WorkoutListEvent();
}

class WorkoutListAddEvent extends WorkoutListEvent {
  final WorkoutModel timer;

  const WorkoutListAddEvent(this.timer);

  @override
  List<Object> get props => [timer];
}
