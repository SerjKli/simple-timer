import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simpletimer/models/TimerModel.dart';

part 'timer_list_event.dart';
part 'timer_list_state.dart';

class TimerListBloc extends Bloc<TimerListEvent, TimerListState> {
  TimerListBloc() : super(TimerListInitial()) {
    on<TimerListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
