import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simpletimer/models/TimerModel.dart';
import 'package:simpletimer/modules/play/enums/SwipeDirection.dart';
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
    on<ExitTimerEvent>(_handleExitTimer);

    /// Pause timer
    on<PauseTimerEvent>(_handlePauseTimerEvent);

    /// Continue timer
    on<ContinuePausedTimerEvent>(_handleContinueTimerEvent);

    /// Skip current phase of timer
    /// For example: if current phase = "workout", this event switch to "rest"
    /// If current phase is the last in the list finish timer
    on<SkipCurrentDurationEvent>(_handleSkipCurrentStageEvent);

    /// Double tap on watch on selected timer
    on<TimerDoubleTappedEvent>(_handleDoubleTapEvent);

    /// Long press on watch on selected timer
    on<TimerLongPressedEvent>(_handleLongPressEvent);

    /// Swipe on watch on selected timer
    on<TimerSwipeEvent>(_handleSwipeEvent);
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

  _handleExitTimer(ExitTimerEvent event, Emitter<ActiveTimerState> emit) {
    _exitTimer(emit);
  }

  _exitTimer(emit) {
    emit(const ActiveTimerState());
    locator<NavigationService>().pop();
  }

  _handlePauseTimerEvent(
      PauseTimerEvent event, Emitter<ActiveTimerState> emit) {
    _pauseTimer(emit);
  }

  _pauseTimer(emit) {
    emit(state.copyWith(timerStatus: TimerStatus.pause));
  }

  _handleContinueTimerEvent(
    ContinuePausedTimerEvent event,
    Emitter<ActiveTimerState> emit,
  ) async {
    _continueTimer(emit);
  }

  _continueTimer(emit) {
    final TimerStatus status = state.durations[0].status;

    emit(state.copyWith(
      timerStatus: status,
    ));
  }

  _handleSkipCurrentStageEvent(
      SkipCurrentDurationEvent event, Emitter<ActiveTimerState> emit) {
    _skipCurrentStage(emit);
  }

  _skipCurrentStage(emit) {
    final List<DurationModel> durations = [...state.durations];

    if (state.durations.isEmpty) return;

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

  _handleDoubleTapEvent(event, emit) {
    switch (state.timerStatus) {
      case TimerStatus.ready:
      case TimerStatus.completed:
        _startTimer(emit);
        break;
      case TimerStatus.pause:
        _continueTimer(emit);
        break;
      default:
        _pauseTimer(emit);
    }
  }

  _handleLongPressEvent(event, emit) {
    _exitTimer(emit);
  }

  _handleSwipeEvent(TimerSwipeEvent event, emit) {
    if (event.isRightSwipe) {
      _handleRightSwipe(emit);
    } else {
      _handleLeftSwipe(emit);
    }
  }

  _handleLeftSwipe(emit) {
    switch (state.timerStatus) {
      case TimerStatus.preparing:
      case TimerStatus.workout:
      case TimerStatus.rest:
        _pauseTimer(emit);
        _continueTimer(emit);
        break;
      case TimerStatus.completed:
        _startTimer(emit);
        break;
      default: //,
    }
  }

  _handleRightSwipe(emit) {
    switch (state.timerStatus) {
      case TimerStatus.ready:
        _startTimer(emit);
        break;
      case TimerStatus.pause:
        _continueTimer(emit);
        break;
      case TimerStatus.completed:
        break;
      default:
        _skipCurrentStage(emit);
    }
  }
}
