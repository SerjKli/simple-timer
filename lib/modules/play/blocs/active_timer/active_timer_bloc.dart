import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simpletimer/models/TimerModel.dart';
import 'package:simpletimer/route/NavigationService.dart';
import 'package:simpletimer/utils/extensions/beatify.dart';
import 'package:simpletimer/utils/services/LocatorService.dart';

import '../../enums/TimerStatus.dart';
import '../../models/DurationModel.dart';
import '../../ui/start_timer_screen.dart';

part 'active_timer_event.dart';
part 'active_timer_state.dart';

class ActiveTimerBloc extends Bloc<ActiveTimerEvent, ActiveTimerState> {
  ActiveTimerBloc() : super(const ActiveTimerState()) {
    /// Open specific timer's page
    on<ChooseTimerEvent>(_goToTimerPage);

    /// Start timer
    on<StartTimerEvent>((
      StartTimerEvent event,
      Emitter<ActiveTimerState> emit,
    ) {
      _startTimer(emit);
    });

    /// Restart timer
    on<RestartTimerEvent>((
      RestartTimerEvent event,
      Emitter<ActiveTimerState> emit,
    ) {
      _startTimer(emit);
    });

    /// Exit from timer screen
    on<ExitTimerEvent>(_exitTimer);

    /// Pause timer
    on<PauseTimerEvent>(_pauseTimer);

    /// Continue timer
    on<ContinuePausedTimerEvent>(_continueTimer);

    /// Skip current phase of timer
    /// For example: if current phase = "workout", this event switch to "rest"
    /// If current phase is the last in the list finish timer
    on<SkipCurrentDurationEvent>(_skipCurrentDuration);
  }

  _goToTimerPage(ChooseTimerEvent event, Emitter<ActiveTimerState> emit) {
    emit(ActiveTimerState(timer: event.timer));
    locator<NavigationService>().pushNamed(StartTimerScreen.routeName);
  }

  /// Creating the list of duration types
  /// This list timer will change with decreasing on 1 second top duration
  /// in the list on every Timer.periodic tik
  List<DurationModel> _generateDurationModels(TimerModel timerModel) {
    final List<DurationModel> durations = [];

    /// Check if timer has preparing time
    if (timerModel.needToPrepare) {
      durations.add(
        DurationModel(
          duration: timerModel.prepareDuration,
          status: TimerStatus.preparing,
        ),
      );
    }

    /// For every round it timer add workout and rest durations
    for (int i = 0; i < timerModel.rounds; i++) {
      durations.add(
        DurationModel(
          duration: timerModel.workDuration,
          status: TimerStatus.workout,
        ),
      );

      durations.add(
        DurationModel(
          duration: timerModel.restDuration,
          status: TimerStatus.rest,
        ),
      );
    }

    return durations;
  }

  _startTimer(Emitter<ActiveTimerState> emit) async {
    final TimerStatus status = state.timer!.needToPrepare
        ? TimerStatus.preparing
        : TimerStatus.workout;

    final durations = _generateDurationModels(state.timer!);

    emit(state.copyWith(
      timerStatus: status,
      durations: durations,
    ));
  }

  _exitTimer(ExitTimerEvent event, Emitter<ActiveTimerState> emit) {
    emit(const ActiveTimerState());
    locator<NavigationService>().pop();
  }

  _pauseTimer(PauseTimerEvent event, Emitter<ActiveTimerState> emit) {
    emit(state.copyWith(timerStatus: TimerStatus.pause));
  }

  _continueTimer(
    ContinuePausedTimerEvent event,
    Emitter<ActiveTimerState> emit,
  ) async {
    final TimerStatus status = state.durations[0].status;

    emit(state.copyWith(
      timerStatus: status,
    ));
  }

  _skipCurrentDuration(
      SkipCurrentDurationEvent event, Emitter<ActiveTimerState> emit) {
    final List<DurationModel> durations = [...state.durations];

    durations.removeAt(0);

    if (durations.isEmpty) {
      emit(ActiveTimerState(
        timer: state.timer,
        timerStatus: TimerStatus.completed,
      ));
    } else {
      final TimerStatus status = durations[0].status;

      emit(state.copyWith(
        timerStatus: status,
        durations: durations,
      ));
    }
  }
}
