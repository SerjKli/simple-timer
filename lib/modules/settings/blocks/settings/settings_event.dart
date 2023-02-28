part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class ChangePlaySoundSettingEvent extends SettingsEvent {
  const ChangePlaySoundSettingEvent();

  @override
  List<Object?> get props => [];
}

class ChangeWatchSkinSettingEvent extends SettingsEvent {
  final String skinName;

  const ChangeWatchSkinSettingEvent(this.skinName);

  @override
  List<Object?> get props => [skinName];
}

class ChangeSoundFileNameSettingEvent extends SettingsEvent {
  final String soundFileName;

  const ChangeSoundFileNameSettingEvent(this.soundFileName);

  @override
  List<Object?> get props => [soundFileName];
}

class ChangeVibrationActiveStatusSettingEvent extends SettingsEvent {
  const ChangeVibrationActiveStatusSettingEvent();

  @override
  List<Object?> get props => [];
}

class OpenDeveloperWebsiteEvent extends SettingsEvent {
  const OpenDeveloperWebsiteEvent();

  @override
  List<Object?> get props => [];
}

class ChangeBackgroundDisplayingEvent extends SettingsEvent {
  const ChangeBackgroundDisplayingEvent();

  @override
  List<Object?> get props => [];
}
