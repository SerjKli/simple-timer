part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();
}

class OpenTimerEditingFormEvent extends TimerEvent {
  final TimerModel timer;
  final bool isEditMode;

  const OpenTimerEditingFormEvent(this.timer, {this.isEditMode = false});

  @override
  List<Object?> get props => [isEditMode, timer];
}

class TimerChangeRoundsEvent extends TimerEvent {
  final int? newRoundsValue;

  const TimerChangeRoundsEvent(this.newRoundsValue);

  @override
  List<Object?> get props => [newRoundsValue];
}

class TimerChangeNameEvent extends TimerEvent {
  final String name;

  const TimerChangeNameEvent(this.name);

  @override
  List<Object?> get props => [name];
}

class TimerSavingErrorEvent extends TimerEvent {
  final AppException exception;

  const TimerSavingErrorEvent(this.exception);

  @override
  List<Object?> get props => [exception];
}

class TimerVaryDurationEvent extends TimerEvent {
  final DurationType durationType;
  final int value;

  const TimerVaryDurationEvent(this.value, this.durationType);

  @override
  List<Object?> get props => [value, durationType];
}

class TimerManualChangeMinutesDurationEvent extends TimerEvent {
  final DurationType durationType;
  final String value;

  const TimerManualChangeMinutesDurationEvent(this.value, this.durationType);

  @override
  List<Object?> get props => [value, durationType];
}

class TimerManualChangeSecondsDurationEvent extends TimerEvent {
  final DurationType durationType;
  final String value;

  const TimerManualChangeSecondsDurationEvent(this.value, this.durationType);

  @override
  List<Object?> get props => [value, durationType];
}
