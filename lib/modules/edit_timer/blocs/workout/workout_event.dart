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

class WorkoutChangeDurationEvent extends WorkoutEvent {
  final DurationType durationType;
  final int newDurationValue;

  const WorkoutChangeDurationEvent(this.newDurationValue, this.durationType);

  @override
  List<Object?> get props => [newDurationValue, durationType];
}

class WorkoutManualSetMinutesEvent extends WorkoutEvent {
  final DurationType durationType;
  final String value;

  const WorkoutManualSetMinutesEvent(this.durationType, this.value);

  bool get isWork => durationType == DurationType.workout;

  @override
  List<Object?> get props => [durationType, value];
}

class WorkoutManualSetSecondsEvent extends WorkoutEvent {
  final DurationType durationType;
  final String value;

  const WorkoutManualSetSecondsEvent(this.durationType, this.value);

  bool get isWork => durationType == DurationType.workout;

  @override
  List<Object?> get props => [durationType, value];
}

class WorkoutChangeNameEvent extends WorkoutEvent {
  const WorkoutChangeNameEvent();

  @override
  List<Object?> get props => [];
}
