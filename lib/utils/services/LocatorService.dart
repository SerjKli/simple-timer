import 'package:audioplayers/audioplayers.dart';
import 'package:get_it/get_it.dart';
import 'package:simpletimer/repositories/active_timer_repository.dart';
import 'package:simpletimer/utils/services/audio_services/AudioServiceContract.dart';
import 'package:simpletimer/utils/services/audio_services/AudioplayersAudioServiceImpl.dart';

import '../../route/NavigationService.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());

  locator.registerLazySingleton(() => ActiveTimerRepository());

  locator.registerLazySingleton<AudioServiceContract>(
    () => AudioplayersAudioServiceImpl(AudioPlayer()),
  );
}
