part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final String skinName;
  final bool playSoundOnLastThreeSeconds;
  final String soundName;
  final bool vibrationActive;
  final double volume;

  const SettingsState({
    this.skinName = BasicSkin.skinName,
    this.playSoundOnLastThreeSeconds = false,
    this.soundName = 'base',
    this.vibrationActive = false,
    this.volume = 100,
  });

  String getSoundFileNameBasedOnSecond(int second) {
    String fileName;
    switch (soundName) {
      case 'base':
        fileName = "base";
        break;
      case 'race':
        fileName = "race";
        break;
      default:
        fileName = "base";
    }

    final fileNameSuffix = second == 0 ? '_finish' : '';
    return 'audio/timer_sounds/$fileName$fileNameSuffix.wav';
  }

  @override
  List<Object> get props => [
        skinName,
        playSoundOnLastThreeSeconds,
        soundName,
        vibrationActive,
        volume,
      ];

  Map<String, dynamic> toMap() {
    return {
      'skinName': skinName,
      'playSoundOnLastThreeSeconds': playSoundOnLastThreeSeconds,
      'soundName': soundName,
      'vibrationActive': vibrationActive,
      'volume': volume,
    };
  }

  factory SettingsState.fromMap(Map<String, dynamic> map) {
    return SettingsState(
      skinName: map['skinName'] as String,
      playSoundOnLastThreeSeconds: map['playSoundOnLastThreeSeconds'] as bool,
      soundName: map['soundName'] as String,
      vibrationActive: map['vibrationActive'] as bool,
      volume: map['volume'] as double,
    );
  }

  SettingsState copyWith({
    String? skinName,
    bool? playSoundOnLastThreeSeconds,
    String? soundName,
    bool? vibrationActive,
    double? volume,
  }) {
    return SettingsState(
      skinName: skinName ?? this.skinName,
      playSoundOnLastThreeSeconds: playSoundOnLastThreeSeconds ?? this.playSoundOnLastThreeSeconds,
      soundName: soundName ?? this.soundName,
      vibrationActive: vibrationActive ?? this.vibrationActive,
      volume: volume ?? this.volume,
    );
  }
}
