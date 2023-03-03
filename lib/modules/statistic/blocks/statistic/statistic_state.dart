part of 'statistic_bloc.dart';

class StatisticState extends Equatable {
  /// Total count of passed stages
  final int stages;

  /// Total count of passed seconds
  final int seconds;

  /// Total count of passed trainings
  final int trainings;

  const StatisticState({
    this.stages = 0,
    this.seconds = 0,
    this.trainings = 0,
  });

  @override
  List<Object> get props => [stages, seconds, trainings];

  StatisticState copyWith({
    int? stages,
    int? seconds,
    int? trainings,
  }) {
    return StatisticState(
      stages: stages ?? this.stages,
      seconds: seconds ?? this.seconds,
      trainings: trainings ?? this.trainings,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'stages': stages,
      'seconds': seconds,
      'trainings': trainings,
    };
  }

  factory StatisticState.fromMap(Map<String, dynamic> map) {
    return StatisticState(
      stages: map['stages'] as int,
      seconds: map['seconds'] as int,
      trainings: map['trainings'] as int,
    );
  }
}
