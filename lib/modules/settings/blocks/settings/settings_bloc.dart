import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:simpletimer/modules/edit_timer/blocs/timer/exports.dart';
import 'package:simpletimer/utils/assets/AudioAssets.dart';
import 'package:simpletimer/utils/services/ConfigService.dart';
import 'package:simpletimer/utils/services/audio_services/AudioServiceContract.dart';
import 'package:simpletimer/widgets/watch_skins/basic_skin/basic_skin.dart';
import 'package:url_launcher/url_launcher.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends HydratedBloc<SettingsEvent, SettingsState> {
  final AudioServiceContract audioService;

  SettingsBloc({required this.audioService}) : super(const SettingsState()) {
    /// Change setting "play sound on last three seconds fo the timer"
    on<ChangePlaySoundSettingEvent>(_changePlaySoundSetting);

    /// Change watch skin
    on<ChangeWatchSkinSettingEvent>(_changeWatchSkin);

    /// Change sound file name
    on<ChangeSoundFileNameSettingEvent>(_changeSoundFileName);

    /// Change vibration active status
    on<ChangeVibrationActiveStatusSettingEvent>(_changeVibrationStatus);

    /// Open developer website event
    on<OpenDeveloperWebsiteEvent>(_openDeveloperWebsite);

    /// Change active timer background displaying property
    on<ChangeBackgroundDisplayingEvent>(_changeBackgroundDisplayingValue);
  }

  _changePlaySoundSetting(
    ChangePlaySoundSettingEvent event,
    Emitter<SettingsState> emit,
  ) {
    emit(
      state.copyWith(
          playSoundOnLastThreeSeconds: !state.playSoundOnLastThreeSeconds),
    );
  }

  _changeWatchSkin(
    ChangeWatchSkinSettingEvent event,
    Emitter<SettingsState> emit,
  ) {
    emit(state.copyWith(skinName: event.skinName));
  }

  _changeSoundFileName(
    ChangeSoundFileNameSettingEvent event,
    Emitter<SettingsState> emit,
  ) {
    debugPrint(
        "settingbloc file name get ${event.soundFileName}"); //TODO: remove debugging

    /// Play selected sound
    audioService.playFromAssets(
      AudioAssets.base.replaceFirst('base', event.soundFileName),
    );

    emit(state.copyWith(soundName: event.soundFileName));
  }

  _changeVibrationStatus(
    ChangeVibrationActiveStatusSettingEvent event,
    Emitter<SettingsState> emit,
  ) {
    emit(state.copyWith(vibrationActive: !state.vibrationActive));
  }

  _openDeveloperWebsite(event, emit) async {
    String urlString =
        await ConfigService.getConfig(ConfigService.developerWebsiteUrl);

    final Uri url = Uri.parse(urlString);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  _changeBackgroundDisplayingValue(event, emit) {
    emit(state.copyWith(
      showBackgroundForActiveTimer: !state.showBackgroundForActiveTimer,
    ));
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return state.toMap();
  }
}
