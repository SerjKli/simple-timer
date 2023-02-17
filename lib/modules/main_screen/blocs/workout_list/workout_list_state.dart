part of 'workout_list_bloc.dart';

class WorkoutListState extends Equatable {
  final List<WorkoutModel> workouts;

  const WorkoutListState({this.workouts = const <WorkoutModel>[]});

  @override
  List<Object> get props => [workouts];

  List<WorkoutModel> get allWorkouts => workouts;
  int get workoutsLength => allWorkouts.length;
  bool get isEmpty => workoutsLength == 0;

  Map<String, dynamic> toMap() {
    return {
      'workouts': workouts.map((t) => t.toMap()).toList(),
    };
  }

  factory WorkoutListState.fromMap(Map<String, dynamic> map) {
    return WorkoutListState(
      workouts: List<WorkoutModel>.from(
          map['workouts']?.map((t) => WorkoutModel.fromMap(t))).toList(),
    );
  }
}
