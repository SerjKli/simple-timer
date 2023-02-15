import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpletimer/models/WorkoutModel.dart';

part 'workout_list_event.dart';
part 'workout_list_state.dart';

class WorkoutListBloc extends Bloc<WorkoutListEvent, WorkoutListState> {
  WorkoutListBloc() : super(const WorkoutListState()) {
    on<WorkoutListAddEvent>(_addTimer);
  }

  /// Add new timer to list
  void _addTimer(WorkoutListAddEvent event, Emitter<WorkoutListState> emit) {
    final List<WorkoutModel> timers = [...state.allTimers, event.timer];

    emit(WorkoutListState(timers: timers));
  }
}
