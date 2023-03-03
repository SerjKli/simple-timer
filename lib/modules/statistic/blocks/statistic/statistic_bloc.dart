import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:simpletimer/repositories/active_timer_repository.dart';

part 'statistic_event.dart';
part 'statistic_state.dart';

class StatisticBloc extends HydratedBloc<StatisticEvent, StatisticState> {
  final ActiveTimerRepository activeTimerRepository;
  late final StreamSubscription activeTimerSecondsSubscription;
  late final StreamSubscription activeTimerStagesSubscription;
  late final StreamSubscription activeTimerTrainingsSubscription;

  @override
  Future<void> close() {
    activeTimerSecondsSubscription.cancel();
    activeTimerStagesSubscription.cancel();
    activeTimerTrainingsSubscription.cancel();
    return super.close();
  }

  void _subscribeOnActiveTimerStreams() {
    activeTimerSecondsSubscription = activeTimerRepository.seconds.listen(
      (newSecondsValue) => _addSeconds(newSecondsValue),
    );

    activeTimerStagesSubscription = activeTimerRepository.stages.listen(
      (_) => _addStage(),
    );

    activeTimerTrainingsSubscription = activeTimerRepository.trainings.listen(
      (_) => _addTraining(),
    );
  }

  StatisticBloc(this.activeTimerRepository) : super(const StatisticState()) {
    _subscribeOnActiveTimerStreams();

    on<ClearStatisticEvent>(_clearStatisticData);
  }

  _addSeconds(int seconds) {
    emit(state.copyWith(seconds: state.seconds + seconds));
  }

  _addStage() => emit(state.copyWith(stages: state.stages + 1));
  _addTraining() => emit(state.copyWith(trainings: state.trainings + 1));

  _clearStatisticData(event, emit) {
    emit(const StatisticState());
  }

  @override
  StatisticState? fromJson(Map<String, dynamic> json) {
    return StatisticState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(StatisticState state) {
    return state.toMap();
  }
}
