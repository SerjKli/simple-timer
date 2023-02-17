import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:simpletimer/models/WorkoutModel.dart';
import 'package:simpletimer/modules/edit_timer/blocs/workout/exports.dart';
import 'package:simpletimer/modules/edit_timer/enums/DurationType.dart';
import 'package:simpletimer/utils/exceptions/AppException.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  WorkoutBloc() : super(WorkoutState(WorkoutModel.template())) {
    /// Saving workout error event
    /// This event triggers, when user clicks "save workout" button, but workout model has some errors
    /// and not ready to be saved
    on<WorkoutSavingErrorEvent>(_setErrorOnWorkoutSaving);

    /// Change workout's name
    on<WorkoutChangeNameEvent>(_changeWorkoutName);

    /// Change workout's rounds value
    on<WorkoutChangeRoundsEvent>(_changeRoundsCount);

    /// Change duration of some property, based on DurationType
    /// This event triggers, when user clicks "plus"/"minus" buttons to increase/decrease
    /// the value of selected property
    on<WorkoutVaryDurationEvent>(_varySecondsToDurationByDurationType);

    /// Manual change MINUTES duration of some property, based on DurationType
    ///
    /// This event triggers, when user manually changes the value of "minutes" field of some property
    /// i.e. workout, rest, preparing, or clicks "plus"/"minus" buttons
    on<WorkoutManualChangeMinutesDurationEvent>(_manualSetMinutesByDurationType);

    /// Manual change SECONDS duration of some property, based on DurationType
    ///
    /// This event triggers, when user manually changes the value of "seconds" field of some property
    /// i.e. workout, rest, preparing, or clicks "plus"/"minus" buttons
    on<WorkoutManualChangeSecondsDurationEvent>(_manualSetSecondsByDurationType);
  }

  /// Update duration value of some property, based on DurationType
  WorkoutModel _updateWorkoutModelDurationValueByDurationType(DurationType type, int seconds) {
    switch (type) {
      case (DurationType.prepareMinutes):
      case (DurationType.prepareSeconds):
        return state.workout.copyWith(prepareDuration: seconds);

      case (DurationType.workoutMinutes):
      case (DurationType.workoutSeconds):
        return state.workout.copyWith(workDuration: seconds);

      case (DurationType.restMinutes):
      case (DurationType.restSeconds):
        return state.workout.copyWith(restDuration: seconds);

      default:
        throw Exception("Undefined duration type");
    }
  }

  _changeWorkoutName(WorkoutChangeNameEvent event, Emitter<WorkoutState> emit) {
    WorkoutModel model = state.workout.copyWith(name: event.name);

    emit(WorkoutState(model));
  }

  _changeRoundsCount(WorkoutChangeRoundsEvent event, Emitter<WorkoutState> emit) {
    int newRounds = event.newRoundsValue ?? WorkoutModel.minimalRounds;

    if (newRounds == 0) newRounds = 1;

    if (newRounds > WorkoutModel.maximumRounds) newRounds = WorkoutModel.maximumRounds;

    final newWorkout = state.workout.copyWith(rounds: newRounds);

    emit(WorkoutState(newWorkout));
  }

  /// Getting current duration value of some property, based on DurationType
  int _getCurrentDurationValueByDurationType(DurationType type) {
    switch (type) {
      case (DurationType.prepareMinutes):
      case (DurationType.prepareSeconds):
        return state.workout.prepareDuration;
      case (DurationType.workoutMinutes):
      case (DurationType.workoutSeconds):
        return state.workout.workDuration;
      case (DurationType.restMinutes):
      case (DurationType.restSeconds):
        return state.workout.restDuration;
      default:
        throw Exception("Undefined duration type");
    }
  }

  _varySecondsToDurationByDurationType(WorkoutVaryDurationEvent event, Emitter<WorkoutState> emit) {
    final int currentSeconds = _getCurrentDurationValueByDurationType(event.durationType);

    int updatedDurationValue = currentSeconds + event.value;

    if (updatedDurationValue < 1) updatedDurationValue = WorkoutModel.minimumDuration;

    if (updatedDurationValue == (WorkoutModel.minimumDuration + WorkoutModel.defaultSecondsStep)) {
      updatedDurationValue = WorkoutModel.defaultSecondsStep;
    }

    final WorkoutModel workout = _updateWorkoutModelDurationValueByDurationType(
      event.durationType,
      updatedDurationValue,
    );

    emit(WorkoutState(workout));
  }

  _manualSetMinutesByDurationType(
    WorkoutManualChangeMinutesDurationEvent event,
    Emitter<WorkoutState> emit,
  ) {
    int minutes;
    int currentSecondsValue;

    switch (event.durationType) {
      case DurationType.prepareMinutes:
        currentSecondsValue = state.workout.prepareSeconds;
        break;
      case DurationType.workoutMinutes:
        currentSecondsValue = state.workout.workoutSeconds;
        break;
      case DurationType.restMinutes:
        currentSecondsValue = state.workout.restSeconds;
        break;

      default:
        throw Exception("Undefined duration type");
    }

    minutes = event.value.isEmpty ? 0 : int.parse(event.value);

    final int updatedSecondsValue = (minutes * 60) + currentSecondsValue;

    final WorkoutModel workout = _updateWorkoutModelDurationValueByDurationType(
      event.durationType,
      updatedSecondsValue,
    );

    emit(WorkoutState(workout));
  }

  _manualSetSecondsByDurationType(
    WorkoutManualChangeSecondsDurationEvent event,
    Emitter<WorkoutState> emit,
  ) {
    int seconds;
    int currentMinutesValue;

    switch (event.durationType) {
      case DurationType.prepareSeconds:
        currentMinutesValue = state.workout.prepareMinutes;
        break;
      case DurationType.workoutSeconds:
        currentMinutesValue = state.workout.workoutMinutes;
        break;
      case DurationType.restSeconds:
        currentMinutesValue = state.workout.restMinutes;
        break;

      default:
        throw Exception("Undefined duration type");
    }

    seconds = event.value.isEmpty ? 0 : int.parse(event.value);

    final int updatedSecondsValue = (currentMinutesValue * 60) + seconds;

    final WorkoutModel workout = _updateWorkoutModelDurationValueByDurationType(
      event.durationType,
      updatedSecondsValue,
    );

    emit(WorkoutState(workout));
  }

  _setErrorOnWorkoutSaving(WorkoutSavingErrorEvent event, Emitter<WorkoutState> emit) {
    emit(WorkoutState(state.workout, exception: event.exception));
  }
}
