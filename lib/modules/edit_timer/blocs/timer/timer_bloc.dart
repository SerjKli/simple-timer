import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simpletimer/models/TimerModel.dart';
import 'package:simpletimer/modules/edit_timer/blocs/timer/exports.dart';
import 'package:simpletimer/modules/edit_timer/enums/DurationType.dart';
import 'package:simpletimer/modules/edit_timer/ui/timer_form_screen.dart';
import 'package:simpletimer/route/NavigationService.dart';
import 'package:simpletimer/utils/exceptions/AppException.dart';
import 'package:simpletimer/utils/services/LocatorService.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerState(timer: TimerModel.template())) {
    /// Open screen for editing timer's properties
    /// Event triggers when user clicks "Create timer" button on the main screen,
    /// or "edit" button on timers list
    on<OpenTimerEditingFormEvent>(_openTimerEditingScreen);

    /// Saving timer error event
    /// This event triggers, when user clicks "save timer" button, but timer model has some errors
    /// and not ready to be saved
    on<TimerSavingErrorEvent>(_setErrorOnTimerSaving);

    /// Change timer's name
    on<TimerChangeNameEvent>(_changeTimerName);

    /// Change timer's rounds value
    on<TimerChangeRoundsEvent>(_changeRoundsCount);

    /// Change duration of some property, based on DurationType
    /// This event triggers, when user clicks "plus"/"minus" buttons to increase/decrease
    /// the value of selected property
    on<TimerVaryDurationEvent>(_varySecondsToDurationByDurationType);

    /// Manual change MINUTES duration of some property, based on DurationType
    ///
    /// This event triggers, when user manually changes the value of "minutes" field of some property
    /// i.e. timer, rest, preparing, or clicks "plus"/"minus" buttons
    on<TimerManualChangeMinutesDurationEvent>(_manualSetMinutesByDurationType);

    /// Manual change SECONDS duration of some property, based on DurationType
    ///
    /// This event triggers, when user manually changes the value of "seconds" field of some property
    /// i.e. timer, rest, preparing, or clicks "plus"/"minus" buttons
    on<TimerManualChangeSecondsDurationEvent>(_manualSetSecondsByDurationType);
  }

  _openTimerEditingScreen(
    OpenTimerEditingFormEvent event,
    Emitter<TimerState> emit,
  ) {
    emit(state.copyWith(timer: event.timer, isEditMode: event.isEditMode));

    locator<NavigationService>().pushNamed(TimerFormScreen.routeName);
  }

  /// Update duration value of some property, based on DurationType
  TimerModel _updateTimerModelDurationValueByDurationType(
    DurationType type,
    int seconds,
  ) {
    switch (type) {
      case (DurationType.prepareMinutes):
      case (DurationType.prepareSeconds):
        return state.timer.copyWith(prepareDuration: seconds);

      case (DurationType.timerMinutes):
      case (DurationType.timerSeconds):
        return state.timer.copyWith(workDuration: seconds);

      case (DurationType.restMinutes):
      case (DurationType.restSeconds):
        return state.timer.copyWith(restDuration: seconds);

      default:
        throw Exception("Undefined duration type");
    }
  }

  _changeTimerName(TimerChangeNameEvent event, Emitter<TimerState> emit) {
    TimerModel model = state.timer.copyWith(name: event.name);

    emit(state.copyWith(timer: model));
  }

  _changeRoundsCount(TimerChangeRoundsEvent event, Emitter<TimerState> emit) {
    int newRounds = event.newRoundsValue ?? TimerModel.minimalRounds;

    if (newRounds == 0) newRounds = 1;

    if (newRounds > TimerModel.maximumRounds) {
      newRounds = TimerModel.maximumRounds;
    }

    final newTimer = state.timer.copyWith(rounds: newRounds);

    emit(state.copyWith(timer: newTimer));
  }

  /// Getting current duration value of some property, based on DurationType
  int _getCurrentDurationValueByDurationType(DurationType type) {
    switch (type) {
      case (DurationType.prepareMinutes):
      case (DurationType.prepareSeconds):
        return state.timer.prepareDuration;
      case (DurationType.timerMinutes):
      case (DurationType.timerSeconds):
        return state.timer.workDuration;
      case (DurationType.restMinutes):
      case (DurationType.restSeconds):
        return state.timer.restDuration;
      default:
        throw Exception("Undefined duration type");
    }
  }

  _varySecondsToDurationByDurationType(
      TimerVaryDurationEvent event, Emitter<TimerState> emit) {
    final int currentSeconds =
        _getCurrentDurationValueByDurationType(event.durationType);

    int updatedDurationValue = currentSeconds + event.value;

    if (updatedDurationValue < 1) {
      updatedDurationValue = TimerModel.minimumDuration;
    }

    if (updatedDurationValue ==
        (TimerModel.minimumDuration + TimerModel.defaultSecondsStep)) {
      updatedDurationValue = TimerModel.defaultSecondsStep;
    }

    final TimerModel timer = _updateTimerModelDurationValueByDurationType(
      event.durationType,
      updatedDurationValue,
    );

    emit(state.copyWith(timer: timer));
  }

  _manualSetMinutesByDurationType(
    TimerManualChangeMinutesDurationEvent event,
    Emitter<TimerState> emit,
  ) {
    int minutes;
    int currentSecondsValue;

    switch (event.durationType) {
      case DurationType.prepareMinutes:
        currentSecondsValue = state.timer.prepareSeconds;
        break;
      case DurationType.timerMinutes:
        currentSecondsValue = state.timer.timerSeconds;
        break;
      case DurationType.restMinutes:
        currentSecondsValue = state.timer.restSeconds;
        break;

      default:
        throw Exception("Undefined duration type");
    }

    minutes = event.value.isEmpty ? 0 : int.parse(event.value);

    final int updatedSecondsValue = (minutes * 60) + currentSecondsValue;

    final TimerModel timer = _updateTimerModelDurationValueByDurationType(
      event.durationType,
      updatedSecondsValue,
    );

    emit(state.copyWith(timer: timer));
  }

  _manualSetSecondsByDurationType(
    TimerManualChangeSecondsDurationEvent event,
    Emitter<TimerState> emit,
  ) {
    int seconds;
    int currentMinutesValue;

    switch (event.durationType) {
      case DurationType.prepareSeconds:
        currentMinutesValue = state.timer.prepareMinutes;
        break;
      case DurationType.timerSeconds:
        currentMinutesValue = state.timer.timerMinutes;
        break;
      case DurationType.restSeconds:
        currentMinutesValue = state.timer.restMinutes;
        break;

      default:
        throw Exception("Undefined duration type");
    }

    seconds = event.value.isEmpty ? 0 : int.parse(event.value);

    final int updatedSecondsValue = (currentMinutesValue * 60) + seconds;

    final TimerModel timer = _updateTimerModelDurationValueByDurationType(
      event.durationType,
      updatedSecondsValue,
    );

    emit(state.copyWith(timer: timer));
  }

  _setErrorOnTimerSaving(
    TimerSavingErrorEvent event,
    Emitter<TimerState> emit,
  ) {
    emit(state.copyWith(exception: event.exception));
  }
}
