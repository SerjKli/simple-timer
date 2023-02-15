import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class WorkoutModel extends Equatable {
  final String uuid;
  final String name;
  final int rounds;
  final int workDuration;
  final int restDuration;

  const WorkoutModel({
    required this.uuid,
    required this.name,
    required this.rounds,
    required this.workDuration,
    required this.restDuration,
  });

  static WorkoutModel template() {
    return WorkoutModel(
      uuid: const Uuid().v1(),
      name: "My awesome workout",
      rounds: 3,
      workDuration: 30,
      restDuration: 30,
    );
  }

  int get workoutMinutes => workDuration ~/ 60;
  int get workoutSeconds => workDuration - (workoutMinutes * 60);
  int get restMinutes => restDuration ~/ 60;
  int get restSeconds => restDuration - (restMinutes * 60);

  @override
  List<Object?> get props => [uuid, name, rounds, workDuration, restDuration];

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'name': name,
      'rounds': rounds,
      'workDuration': workDuration,
      'restDuration': restDuration,
    };
  }

  factory WorkoutModel.fromMap(Map<String, dynamic> map) {
    return WorkoutModel(
      uuid: map['uuid'] as String,
      name: map['name'] as String,
      rounds: map['rounds'] as int,
      workDuration: map['workDuration'] as int,
      restDuration: map['restDuration'] as int,
    );
  }

  @override
  String toString() {
    return 'WorkoutModel{uuid: $uuid, name: $name, rounds: $rounds, workDuration: $workDuration, restDuration: $restDuration}';
  }

  WorkoutModel copyWith({
    String? uuid,
    String? name,
    int? rounds,
    int? workDuration,
    int? restDuration,
  }) {
    return WorkoutModel(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      rounds: rounds ?? this.rounds,
      workDuration: workDuration ?? this.workDuration,
      restDuration: restDuration ?? this.restDuration,
    );
  }
}
