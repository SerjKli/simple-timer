part of 'workout_bloc.dart';

class WorkoutState extends Equatable {
  final WorkoutModel workout;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController roundsController = TextEditingController();
  final TextEditingController prepareMinutesController =
      TextEditingController();
  final TextEditingController prepareSecondsController =
      TextEditingController();
  final TextEditingController workoutMinutesController =
      TextEditingController();
  final TextEditingController workoutSecondsController =
      TextEditingController();
  final TextEditingController restMinutesController = TextEditingController();
  final TextEditingController restSecondsController = TextEditingController();

  WorkoutState(this.workout) {
    init();
  }

  init() {
    nameController.text = workout.name;
    roundsController.text = workout.rounds.toStringAsFixed(0);
    prepareMinutesController.text =
        workout.workoutMinutes.toStringAsFixed(0).padLeft(2, '0');
    prepareSecondsController.text =
        workout.workoutSeconds.toStringAsFixed(0).padLeft(2, '0');
    workoutMinutesController.text =
        workout.workoutMinutes.toStringAsFixed(0).padLeft(2, '0');
    workoutSecondsController.text =
        workout.workoutSeconds.toStringAsFixed(0).padLeft(2, '0');
    restMinutesController.text =
        workout.restMinutes.toStringAsFixed(0).padLeft(2, '0');
    restSecondsController.text =
        workout.restSeconds.toStringAsFixed(0).padLeft(2, '0');
  }

  TextEditingController getMinutesControllerByType(
    DurationType type,
  ) {
    switch (type) {
      case (DurationType.prepare):
        return prepareMinutesController;
      case (DurationType.workout):
        return workoutMinutesController;
      case (DurationType.rest):
        return restMinutesController;
      default:
        throw Exception("Undefined duration type");
    }
  }

  @override
  List<Object?> get props => [
        workout,
        prepareMinutesController,
        prepareSecondsController,
        workoutMinutesController,
        workoutSecondsController,
        restMinutesController,
        restSecondsController,
      ];
}
