import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpletimer/models/TimerModel.dart';

part 'timer_list_event.dart';
part 'timer_list_state.dart';

class TimerListBloc extends Bloc<TimerListEvent, TimerListState> {
  TimerListBloc() : super(const TimerListState()) {
    on<TimerListAddEvent>(_addTimer);
  }

  /// Add new timer to list
  void _addTimer(TimerListAddEvent event, Emitter<TimerListState> emit) {
    final List<TimerModel> timers = [...state.allTimers, event.timer];

    emit(TimerListState(timers: timers));
  }
}
