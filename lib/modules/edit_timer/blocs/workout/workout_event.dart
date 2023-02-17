part of 'workout_bloc.dart';

abstract class WorkoutEvent extends Equatable {
  const WorkoutEvent();
}

class WorkoutChangeRoundsEvent extends WorkoutEvent {
  final int? newRoundsValue;

  const WorkoutChangeRoundsEvent(this.newRoundsValue);

  @override
  List<Object?> get props => [newRoundsValue];
}

class WorkoutChangeNameEvent extends WorkoutEvent {
  final String name;
  const WorkoutChangeNameEvent(this.name);

  @override
  List<Object?> get props => [name];
}

class WorkoutSavingErrorEvent extends WorkoutEvent {
  final AppException exception;

  const WorkoutSavingErrorEvent(this.exception);

  @override
  List<Object?> get props => [exception];
}

class WorkoutVaryDurationEvent extends WorkoutEvent {
  final DurationType durationType;
  final int value;
  const WorkoutVaryDurationEvent(this.value, this.durationType);

  @override
  List<Object?> get props => [value, durationType];
}


class WorkoutManualChangeMinutesDurationEvent extends WorkoutEvent {
  final DurationType durationType;
  final String value;
  const WorkoutManualChangeMinutesDurationEvent(this.value, this.durationType);

  @override
  List<Object?> get props => [value, durationType];
}

class WorkoutManualChangeSecondsDurationEvent extends WorkoutEvent {
  final DurationType durationType;
  final String value;
  const WorkoutManualChangeSecondsDurationEvent(this.value, this.durationType);

  @override
  List<Object?> get props => [value, durationType];
}
