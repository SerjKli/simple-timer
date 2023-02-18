import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:simpletimer/models/TimerModel.dart';
import 'package:simpletimer/route/NavigationService.dart';
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
    on<StartTimerEvent>(_startTimer);
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

  _startTimer(StartTimerEvent event, Emitter<ActiveTimerState> emit) {
    final TimerStatus status = state.timer!.needToPrepare
        ? TimerStatus.preparing
        : TimerStatus.workout;

    final durations = _generateDurationModels(state.timer!);

    final periodicTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      debugPrint("sdasd"); //TODO: remove debugging
    });

    debugPrint("$durations"); //TODO: remove debugging

    emit(state.copyWith(
      timerStatus: status,
      durations: durations,
      periodicTimer: periodicTimer,
    ));
  }
}
