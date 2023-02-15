import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:simpletimer/models/WorkoutModel.dart';
import 'package:simpletimer/modules/edit_timer/enums/DurationType.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  WorkoutBloc() : super(WorkoutState(WorkoutModel.template())) {
    /// Change workout's rounds count event
    on<WorkoutChangeRoundsEvent>(_changeRoundsCount);

    /// Change duration of work or rest, depends on DurationType property in the Event
    on<WorkoutChangeDurationEvent>(_changeDuration);

    /// Manual change duration of work or set, depends on DurationType property in the Event
    on<WorkoutManualSetMinutesEvent>(_manualChangeMinutesDuration);
  }

  /// Change workout's rounds count event
  _changeRoundsCount(
    WorkoutChangeRoundsEvent event,
    Emitter<WorkoutState> emit,
  ) {
    int newRounds =
        event.newRoundsValue ?? int.parse(state.roundsController.text);

    if (newRounds < 1) newRounds = 1;

    if (newRounds > 99) newRounds = 99;

    final newWorkout = state.workout.copyWith(rounds: newRounds);

    emit(WorkoutState(newWorkout));
  }

  /// Change duration of work or rest, depends on DurationType property in Event
  _changeDuration(
    WorkoutChangeDurationEvent event,
    Emitter<WorkoutState> emit,
  ) {
    final int currentSeconds =
        event.isWork ? state.workout.workDuration : state.workout.restDuration;

    int newSeconds = currentSeconds + event.newDurationValue;

    if (newSeconds < 1) newSeconds = 1;

    WorkoutModel workout;
    if (event.isWork) {
      workout = state.workout.copyWith(workDuration: newSeconds);
    } else {
      workout = state.workout.copyWith(restDuration: newSeconds);
    }

    emit(WorkoutState(workout));
  }

  /// Manual change duration of work or set, depends on DurationType property in the Event
  _manualChangeMinutesDuration(
    WorkoutManualSetMinutesEvent event,
    Emitter<WorkoutState> emit,
  ) {
    WorkoutModel model;

    if (event.isWork) {
      final int newMinutes = int.parse(state.workoutMinutesController.text);
      final int currentSeconds = state.workout.workoutSeconds;
      model = state.workout
          .copyWith(workDuration: ((newMinutes * 60) + currentSeconds));
    } else {
      final int newMinutes = int.parse(state.restMinutesController.text);
      final int currentSeconds = state.workout.restSeconds;
      model = state.workout
          .copyWith(restDuration: ((newMinutes * 60) + currentSeconds));
    }

    emit(WorkoutState(model));
  }
}
