import 'package:equatable/equatable.dart';

class TimerModel extends Equatable {
  final String uuid;
  final String name;
  final int rounds;
  final int workDuration;
  final int restDuration;

  const TimerModel({
    required this.uuid,
    required this.name,
    required this.rounds,
    required this.workDuration,
    required this.restDuration,
  });

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

  factory TimerModel.fromMap(Map<String, dynamic> map) {
    return TimerModel(
      uuid: map['uuid'] as String,
      name: map['name'] as String,
      rounds: map['rounds'] as int,
      workDuration: map['workDuration'] as int,
      restDuration: map['restDuration'] as int,
    );
  }
}
