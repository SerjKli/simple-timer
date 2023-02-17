import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:simpletimer/models/WorkoutModel.dart';
import 'package:simpletimer/modules/edit_timer/enums/DurationType.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  WorkoutBloc() : super(WorkoutState(WorkoutModel.template())) {
    /// Change workout's name
    on<WorkoutChangeNameEvent>(_changeWorkoutName);

    /// Change workout's rounds count event
    on<WorkoutChangeRoundsEvent>(_changeRoundsCount);

    /// Change duration of work or rest, depends on DurationType property in the Event
    on<WorkoutChangeDurationEvent>(_changeDuration);

    /// Manual change duration of work or set, depends on DurationType property in the Event
    on<WorkoutManualSetMinutesEvent>(_manualChangeMinutesDuration);

    /// Manual change duration of work or set, depends on DurationType property in the Event
    on<WorkoutManualSetSecondsEvent>(_manualChangeSecondsDuration);
  }

  _changeWorkoutName(WorkoutChangeNameEvent event, Emitter<WorkoutState> emit) {
    WorkoutModel model =
        state.workout.copyWith(name: state.nameController.text);

    emit(WorkoutState(model));
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

  /// Manual change duration of work or set, depends on DurationType property
  /// in the Event
  _manualChangeMinutesDuration(
    WorkoutManualSetMinutesEvent event,
    Emitter<WorkoutState> emit,
  ) {
    //TODO: ! fix bugs with input, when input field is still in focus,
    // but "Save" button clicked
    int minutes;

    if (event.value.isEmpty) {
      minutes = 0;
    } else {
      minutes = int.parse(event.value);
    }

    final int newSeconds = (minutes * 60) +
        (event.isWork
            ? state.workout.workoutSeconds
            : state.workout.restSeconds);

    final WorkoutModel model = event.isWork
        ? state.workout.copyWith(workDuration: newSeconds)
        : state.workout.copyWith(restDuration: newSeconds);

    emit(WorkoutState(model));
  }

  _manualChangeSecondsDuration(
    WorkoutManualSetSecondsEvent event,
    Emitter<WorkoutState> emit,
  ) {
    int seconds;

    if (event.value.isEmpty) {
      seconds = 0;
    } else {
      seconds = int.parse(event.value);
    }

    final WorkoutModel model = event.isWork
        ? state.workout.copyWith(workDuration: seconds)
        : state.workout.copyWith(restDuration: seconds);

    emit(WorkoutState(model));
  }
}
