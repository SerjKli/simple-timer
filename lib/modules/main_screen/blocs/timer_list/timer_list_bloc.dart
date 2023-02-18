import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:simpletimer/models/TimerModel.dart';
import 'package:simpletimer/route/NavigationService.dart';
import 'package:simpletimer/utils/services/LocatorService.dart';

part 'timer_list_event.dart';
part 'timer_list_state.dart';

class TimerListBloc extends HydratedBloc<TimerListEvent, TimerListState> {
  TimerListBloc() : super(const TimerListState()) {
    /// Creating new timer
    on<TimerListAddEvent>(_addTimer);

    /// Updating existing timer
    on<TimerListEditEvent>(_updateTimer);

    /// Deleting timer
    on<TimerListDeleteEvent>(_deleteTimer);
  }

  void _addTimer(TimerListAddEvent event, Emitter<TimerListState> emit) {
    final List<TimerModel> timers = [...state.allTimers, event.timer];

    emit(TimerListState(timers: timers));

    _closeEditingForm();
  }

  void _updateTimer(
    TimerListEditEvent event,
    Emitter<TimerListState> emit,
  ) {
    final allTimers = [...state.allTimers];
    debugPrint("$allTimers"); //TODO: remove debugging
    final index =
        allTimers.indexWhere((element) => element.uuid == event.timer.uuid);

    if (index < 0) return;

    allTimers.replaceRange(index, index + 1, [event.timer]);

    emit(TimerListState(timers: allTimers));

    _closeEditingForm();
  }

  _deleteTimer(
    TimerListDeleteEvent event,
    Emitter<TimerListState> emit,
  ) {
    final allTimers = [...state.allTimers];

    allTimers.remove(event.timer);

    emit(TimerListState(timers: allTimers));
  }

  /// Move from timer editing screen
  void _closeEditingForm() {
    locator<NavigationService>().pop();
  }

  @override
  TimerListState? fromJson(Map<String, dynamic> json) {
    return TimerListState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TimerListState state) {
    return state.toMap();
  }
}
