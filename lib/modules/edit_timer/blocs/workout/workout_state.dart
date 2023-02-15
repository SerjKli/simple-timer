part of 'workout_bloc.dart';

class WorkoutState extends Equatable {
  final WorkoutModel workout;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController roundsController = TextEditingController();
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
    workoutMinutesController.text =
        workout.workoutMinutes.toStringAsFixed(0).padLeft(2, '0');
    workoutSecondsController.text =
        workout.workoutSeconds.toStringAsFixed(0).padLeft(2, '0');
    restMinutesController.text =
        workout.restMinutes.toStringAsFixed(0).padLeft(2, '0');
    restSecondsController.text =
        workout.restSeconds.toStringAsFixed(0).padLeft(2, '0');
  }

  @override
  List<Object?> get props => [
        workout,
        restSecondsController,
        restSecondsController,
        restSecondsController,
        restSecondsController,
        restSecondsController,
        restSecondsController,
      ];
}
