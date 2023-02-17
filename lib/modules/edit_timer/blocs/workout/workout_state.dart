part of 'workout_bloc.dart';

class WorkoutState extends Equatable {
  final AppException? exception;
  final WorkoutModel workout;

  const WorkoutState(this.workout, {this.exception});
  bool get hasError => exception != null;
  String? get errorMessage => exception?.toString();

  int getDurationValueByDurationType(DurationType durationType) {
    switch (durationType) {
      case (DurationType.prepareMinutes):
        return workout.prepareMinutes;
      case (DurationType.prepareSeconds):
        return workout.prepareSeconds;
      case (DurationType.workoutMinutes):
        return workout.workoutMinutes;
      case (DurationType.workoutSeconds):
        return workout.workoutSeconds;
      case (DurationType.restMinutes):
        return workout.restMinutes;
      case (DurationType.restSeconds):
        return workout.restSeconds;
      default:
        throw Exception("Undefined duration type");
    }
  }

  @override
  List<Object?> get props => [
        workout,
        exception,
      ];
}
