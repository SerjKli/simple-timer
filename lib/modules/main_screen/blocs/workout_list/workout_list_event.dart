part of 'workout_list_bloc.dart';

abstract class WorkoutListEvent extends Equatable {
  const WorkoutListEvent();
}

class WorkoutListAddEvent extends WorkoutListEvent {
  final WorkoutModel workout;

  const WorkoutListAddEvent(this.workout);

  @override
  List<Object> get props => [workout];
}
