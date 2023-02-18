import 'package:equatable/equatable.dart';
import 'package:simpletimer/utils/extensions/beatify.dart';
import 'package:simpletimer/utils/services/ValidatorService.dart';
import 'package:uuid/uuid.dart';

class TimerModel extends Equatable {
  static const int defaultRoundStep = 1;
  static const int minimalRounds = 1;
  static const int maximumRounds = 99;
  static const int defaultSecondsStep = 5;
  static const int minimumDuration = 1;
  static const int nameMinLength = 3;
  static const int nameMaxLength = 50;

  final String uuid;
  final String name;
  final int rounds;
  final int prepareDuration;
  final int workDuration;
  final int restDuration;

  const TimerModel({
    required this.uuid,
    required this.name,
    required this.rounds,
    required this.prepareDuration,
    required this.workDuration,
    required this.restDuration,
  });

  static TimerModel template() {
    return TimerModel(
      uuid: const Uuid().v1(),
      name: "My timer",
      rounds: 3,
      prepareDuration: 10,
      workDuration: 30,
      restDuration: 30,
    );
  }

  int get timerMinutes => workDuration ~/ 60;
  int get timerSeconds => workDuration - (timerMinutes * 60);

  int get restMinutes => restDuration ~/ 60;
  int get restSeconds => restDuration - (restMinutes * 60);

  int get prepareMinutes => prepareDuration ~/ 60;
  int get prepareSeconds => prepareDuration - (prepareMinutes * 60);
  bool get needToPrepare => prepareDuration > 0;

  bool get hasError => errorMessage != null;

  String? get errorMessage {
    final String? isNameNotValid = ValidationService.stringIsValid(
      name,
      "Name",
      TimerModel.nameMinLength,
      TimerModel.nameMaxLength,
    );

    if (isNameNotValid != null) return isNameNotValid;

    if (workDuration == 0) return "Please, set timer duration";

    return null;
  }

  @override
  List<Object?> get props =>
      [uuid, name, rounds, prepareDuration, workDuration, restDuration];

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'name': name,
      'rounds': rounds,
      'prepareDuration': prepareDuration,
      'workDuration': workDuration,
      'restDuration': restDuration,
    };
  }

  factory TimerModel.fromMap(Map<String, dynamic> map) {
    return TimerModel(
      uuid: map['uuid'] as String,
      name: map['name'] as String,
      rounds: map['rounds'] as int,
      prepareDuration: map['prepareDuration'] as int,
      workDuration: map['workDuration'] as int,
      restDuration: map['restDuration'] as int,
    );
  }

  @override
  String toString() {
    return 'TimerModel{uuid: $uuid, name: $name, rounds: $rounds, prepareDuration: $prepareDuration, workDuration: $workDuration, restDuration: $restDuration}';
  }

  TimerModel copyWith({
    String? uuid,
    String? name,
    int? rounds,
    int? workDuration,
    int? prepareDuration,
    int? restDuration,
  }) {
    return TimerModel(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      rounds: rounds ?? this.rounds,
      prepareDuration: prepareDuration ?? this.prepareDuration,
      workDuration: workDuration ?? this.workDuration,
      restDuration: restDuration ?? this.restDuration,
    );
  }

  /// Return duration of preparing stage as MM:SS
  String get prepareDurationAsTime =>
      "${prepareMinutes.beautifyForTime}:${prepareSeconds.beautifyForTime}";

  /// Return duration of timer stage as MM:SS
  String get timerDurationAsTime =>
      "${timerMinutes.beautifyForTime}:${timerSeconds.beautifyForTime}";

  /// Return duration of resting stage as MM:SS
  String get restDurationAsTime =>
      "${restMinutes.beautifyForTime}:${restSeconds.beautifyForTime}";
}
