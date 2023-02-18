part of 'timer_bloc.dart';

class TimerState extends Equatable {
  final AppException? exception;
  final TimerModel timer;
  final bool isEditMode;

  const TimerState({
    required this.timer,
    this.exception,
    this.isEditMode = false,
  });

  bool get hasError => exception != null;

  String? get errorMessage => exception?.toString();

  int getDurationValueByDurationType(DurationType durationType) {
    switch (durationType) {
      case (DurationType.prepareMinutes):
        return timer.prepareMinutes;
      case (DurationType.prepareSeconds):
        return timer.prepareSeconds;
      case (DurationType.timerMinutes):
        return timer.timerMinutes;
      case (DurationType.timerSeconds):
        return timer.timerSeconds;
      case (DurationType.restMinutes):
        return timer.restMinutes;
      case (DurationType.restSeconds):
        return timer.restSeconds;
      default:
        throw Exception("Undefined duration type");
    }
  }

  @override
  List<Object?> get props => [
        timer,
        exception,
        isEditMode,
      ];

  TimerState copyWith({
    AppException? exception,
    TimerModel? timer,
    bool? isEditMode,
  }) {
    return TimerState(
      exception: exception ?? this.exception,
      timer: timer ?? this.timer,
      isEditMode: isEditMode ?? this.isEditMode,
    );
  }
}
