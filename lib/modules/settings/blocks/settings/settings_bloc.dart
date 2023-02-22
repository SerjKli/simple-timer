import 'package:equatable/equatable.dart';
import 'package:simpletimer/modules/edit_timer/blocs/timer/exports.dart';
import 'package:simpletimer/widgets/watch_skins/basic_skin/basic_skin.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends HydratedBloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    /// Change setting "play sound on last three seconds fo the timer"
    on<ChangePlaySoundSettingEvent>(_changePlaySoundSetting);

    /// Change watch skin
    on<ChangeWatchSkinSettingEvent>(_changeWatchSkin);

    /// Change sound file name
    on<ChangeSoundFileNameSettingEvent>(_changeSoundFileName);
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
    emit(state.copyWith(soundName: event.soundFileName));
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
