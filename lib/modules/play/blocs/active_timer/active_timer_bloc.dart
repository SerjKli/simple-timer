import 'package:equatable/equatable.dart';
import 'package:simpletimer/models/TimerModel.dart';
import 'package:simpletimer/modules/settings/blocks/settings/exports.dart';
import 'package:simpletimer/repositories/active_timer_repository.dart';
import 'package:simpletimer/route/NavigationService.dart';
import 'package:simpletimer/utils/extensions/beatify.dart';
import 'package:simpletimer/utils/services/LocatorService.dart';
import 'package:simpletimer/utils/services/audio_services/AudioServiceContract.dart';
import 'package:wakelock/wakelock.dart';

import '../../../../utils/enums/TimerStatus.dart';
import '../../enums/GestureActivity.dart';
import '../../models/TimerStageModel.dart';
import '../../ui/start_timer_screen.dart';

part 'active_timer_event.dart';
part 'active_timer_state.dart';

class ActiveTimerBloc extends Bloc<ActiveTimerEvent, ActiveTimerState> {
  final AudioServiceContract audioService;
  final ActiveTimerRepository activeTimerRepository;

  ActiveTimerBloc({
    required this.audioService,
    required this.activeTimerRepository,
  }) : super(const ActiveTimerState()) {
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

    /// Skip current stage of the timer
    /// For example: if current stage = "workout", this event switch to "rest"
    /// If current stage is the last in the list, finish the timer
    on<SkipCurrentTimerStageEvent>(_handleSkipCurrentStageEvent);

    /// Handle watch gesture activities
    on<TimerGestureActivityEvent>(_handleGestureActivity);

    /// Play sound on timer tick
    on<PlaySoundOnTimerTickEvent>(_handlePlaySoundEvent);
  }

  _goToTimerPage(ChooseTimerEvent event, Emitter<ActiveTimerState> emit) {
    final stages = _generateTimerStageModels(event.timer);

    emit(ActiveTimerState(
      timer: event.timer,
      stages: stages,
      stageIndex: 0,
    ));
    locator<NavigationService>().pushNamed(StartTimerScreen.routeName);
  }

  /// Creating the list of duration types
  /// This list timer will change with decreasing on 1 second top duration
  /// in the list on every Timer.periodic tik
  List<TimerStageModel> _generateTimerStageModels(TimerModel timerModel) {
    final List<TimerStageModel> durations = [];

    /// Check if timer has preparing time
    if (timerModel.needToPrepare) {
      durations.add(
        TimerStageModel(
          duration: timerModel.prepareDuration,
          status: TimerStatus.preparing,
        ),
      );
    }

    /// For every round it timer add workout and rest durations
    for (int i = 0; i < timerModel.rounds; i++) {
      durations.add(
        TimerStageModel(
          duration: timerModel.workDuration,
          status: TimerStatus.workout,
        ),
      );

      durations.add(
        TimerStageModel(
          duration: timerModel.restDuration,
          status: TimerStatus.rest,
        ),
      );
    }

    return durations;
  }

  _startTimer(Emitter<ActiveTimerState> emit) async {
    Wakelock.enable();
    final TimerStatus status = state.timer!.needToPrepare
        ? TimerStatus.preparing
        : TimerStatus.workout;

    emit(state.copyWith(
      timerStatus: status,
      stageIndex: 0,
    ));
  }

  _handleExitTimer(ExitTimerEvent event, Emitter<ActiveTimerState> emit) {
    _exitTimer(emit);
  }

  _exitTimer(emit) {
    Wakelock.disable();
    emit(const ActiveTimerState());
    locator<NavigationService>().pop();
  }

  _handlePauseTimerEvent(
      PauseTimerEvent event, Emitter<ActiveTimerState> emit) {
    _pauseTimer(emit);
  }

  _pauseTimer(emit) {
    emit(state.copyWith(
      timerStatus: TimerStatus.pause,
      stages: state.stages,
      stageIndex: state.stageIndex,
    ));
  }

  _handleContinueTimerEvent(
    ContinuePausedTimerEvent event,
    Emitter<ActiveTimerState> emit,
  ) async {
    _continueTimer(emit);
  }

  _continueTimer(emit) {
    if (state.activeStage == null) return;

    emit(state.copyWith(
      timerStatus: state.activeStage!.status,
    ));
  }

  _handleSkipCurrentStageEvent(
    SkipCurrentTimerStageEvent event,
    Emitter<ActiveTimerState> emit,
  ) {
    _skipCurrentStage(emit, event.saveToStatistic);
  }

  _skipCurrentStage(emit, [saveToStatistic = false]) {
    if (state.stages.isEmpty || state.activeStage == null) return;

    if (saveToStatistic) {
      activeTimerRepository.updateSeconds(state.activeStage!.duration);
      activeTimerRepository.updateStages(1);
    }

    if (state.nextStage == null) {
      emit(ActiveTimerState(
        timer: state.timer,
        timerStatus: TimerStatus.completed,
        stages: state.stages,
      ));

      if (saveToStatistic) {
        activeTimerRepository.updateTrainings(1);
      }
    } else {
      emit(state.copyWith(
        timerStatus: state.nextStage!.status,
        stageIndex: state.stageIndex + 1,
      ));
    }
  }

  _handleGestureActivity(TimerGestureActivityEvent event, emit) {
    switch (event.activity) {
      case GestureActivity.doubleTap:
        _handleDoubleTapEvent(emit);
        break;
      case GestureActivity.longPress:
        _handleLongPressEvent(emit);
        break;
      case GestureActivity.swipeLeft:
        _handleLeftSwipe(emit);
        break;
      case GestureActivity.swipeRight:
        _handleRightSwipe(emit);
        break;
    }
  }

  _handleDoubleTapEvent(emit) {
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

  _handleLongPressEvent(emit) {
    _exitTimer(emit);
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

  _handlePlaySoundEvent(PlaySoundOnTimerTickEvent event, emit) {
    /// Do not play any sounds if current timer shows more than 3 seconds
    if (event.second > 4) return;

    if (!event.settings.playSoundOnLastThreeSeconds) return;

    final String audioFileName =
        event.settings.getSoundFileNameBasedOnSecond(event.second);

    final volume = event.settings.volume;

    audioService.playFromAssets(audioFileName, volume / 100);
  }
}
