import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:simpletimer/models/WorkoutModel.dart';

part 'workout_list_event.dart';
part 'workout_list_state.dart';

class WorkoutListBloc extends HydratedBloc<WorkoutListEvent, WorkoutListState> {
  WorkoutListBloc() : super(const WorkoutListState()) {
    on<WorkoutListAddEvent>(_addWorkout);
  }

  /// Add new workout to list
  void _addWorkout(WorkoutListAddEvent event, Emitter<WorkoutListState> emit) {
    final List<WorkoutModel> workouts = [...state.allWorkouts, event.workout];

    emit(WorkoutListState(workouts: workouts));
  }

  @override
  WorkoutListState? fromJson(Map<String, dynamic> json) {
    return WorkoutListState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(WorkoutListState state) {
    return state.toMap();
  }
}
