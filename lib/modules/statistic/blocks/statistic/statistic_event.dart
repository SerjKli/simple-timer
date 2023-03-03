part of 'statistic_bloc.dart';

abstract class StatisticEvent extends Equatable {
  const StatisticEvent();
}

class ClearStatisticEvent extends StatisticEvent {
  const ClearStatisticEvent();

  @override
  List<Object?> get props => [];
}
