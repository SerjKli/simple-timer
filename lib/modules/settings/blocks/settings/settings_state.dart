part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final String skinName;
  final bool playSoundOnLastThreeSeconds;
  final String soundName;
  final bool vibrationActive;

  const SettingsState({
    this.skinName = BasicSkin.skinName,
    this.playSoundOnLastThreeSeconds = false,
    this.soundName = 'base',
    this.vibrationActive = false,
  });

  @override
  List<Object> get props => [
        skinName,
        playSoundOnLastThreeSeconds,
        soundName,
        vibrationActive,
      ];

  Map<String, dynamic> toMap() {
    return {
      'skinName': skinName,
      'playSoundOnLastThreeSeconds': playSoundOnLastThreeSeconds,
      'soundName': soundName,
      'vibrationActive': vibrationActive,
    };
  }

  factory SettingsState.fromMap(Map<String, dynamic> map) {
    return SettingsState(
      skinName: map['skinName'] as String,
      playSoundOnLastThreeSeconds: map['playSoundOnLastThreeSeconds'] as bool,
      soundName: map['soundName'] as String,
      vibrationActive: map['vibrationActive'] as bool,
    );
  }

  SettingsState copyWith({
    String? skinName,
    bool? playSoundOnLastThreeSeconds,
    String? soundName,
    bool? vibrationActive,
  }) {
    return SettingsState(
      skinName: skinName ?? this.skinName,
      playSoundOnLastThreeSeconds:
          playSoundOnLastThreeSeconds ?? this.playSoundOnLastThreeSeconds,
      soundName: soundName ?? this.soundName,
      vibrationActive: vibrationActive ?? this.vibrationActive,
    );
  }
}
