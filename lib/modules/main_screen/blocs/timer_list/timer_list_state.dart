part of 'timer_list_bloc.dart';

class TimerListState extends Equatable {
  final List<TimerModel> timers;

  const TimerListState({this.timers = const <TimerModel>[]});

  @override
  List<Object> get props => [timers];

  List<TimerModel> get allTimers => timers;
  int get timersLength => allTimers.length;
  bool get isEmpty => timersLength == 0;

  Map<String, dynamic> toMap() {
    return {
      'timers': timers.map((t) => t.toMap()).toList(),
    };
  }

  factory TimerListState.fromMap(Map<String, dynamic> map) {
    return TimerListState(
      timers: List<TimerModel>.from(
          map['timers']?.map((t) => TimerModel.fromMap(t))).toList(),
    );
  }
}
