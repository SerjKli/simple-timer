import 'dart:async';

import 'base_repository.dart';

class ActiveTimerRepository extends BaseRepository {
  final _secondsController = StreamController<int>();
  final _stagesController = StreamController<int>();
  final _trainingsController = StreamController<int>();

  Stream<int> get seconds => _secondsController.stream.asBroadcastStream();

  Stream<int> get stages => _stagesController.stream.asBroadcastStream();

  Stream<int> get trainings => _trainingsController.stream.asBroadcastStream();

  void updateSeconds(int seconds) => _secondsController.sink.add(seconds);

  void updateStages(int stages) => _stagesController.sink.add(stages);

  void updateTrainings(int trainings) => _trainingsController.sink.add(trainings);
}
