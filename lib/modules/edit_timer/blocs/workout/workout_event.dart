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

  bool get isWork => durationType == DurationType.workout;

  @override
  List<Object?> get props => [newDurationValue, durationType];
}

class WorkoutManualSetMinutesEvent extends WorkoutEvent {
  final DurationType durationType;

  const WorkoutManualSetMinutesEvent(this.durationType);

  bool get isWork => durationType == DurationType.workout;

  @override
  List<Object?> get props => [durationType];
}
