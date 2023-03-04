part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final String skinName;
  final bool playSoundOnLastThreeSeconds;
  final String soundName;
  final bool vibrationActive;
  final double volume;
  final bool showBackgroundForActiveTimer;

  static const String soundFileExtension = 'mp3';

  const SettingsState({
    this.skinName = BasicSkin.skinName,
    this.playSoundOnLastThreeSeconds = false,
    this.soundName = 'base',
    this.vibrationActive = false,
    this.volume = 100,
    this.showBackgroundForActiveTimer = true,
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
      case 'arcade':
        fileName = "arcade";
        break;
      case 'bell':
        fileName = "bell";
        break;
      default:
        debugPrint("!!! Error: undefined sound name $soundName");
        fileName = "base";
    }

    final fileNameSuffix = second == 1 ? '_finish' : '';

    final fullFileName = "$fileName$fileNameSuffix";
    return AudioAssets.base.replaceFirst('base', fullFileName);
  }

  @override
  List<Object> get props => [
        skinName,
        playSoundOnLastThreeSeconds,
        soundName,
        vibrationActive,
        volume,
        showBackgroundForActiveTimer,
      ];

  Map<String, dynamic> toMap() {
    return {
      'skinName': skinName,
      'playSoundOnLastThreeSeconds': playSoundOnLastThreeSeconds,
      'soundName': soundName,
      'vibrationActive': vibrationActive,
      'volume': volume,
      'showBackgroundForActiveTimer': showBackgroundForActiveTimer,
    };
  }

  factory SettingsState.fromMap(Map<String, dynamic> map) {
    return SettingsState(
      skinName: map['skinName'] as String,
      playSoundOnLastThreeSeconds: map['playSoundOnLastThreeSeconds'] as bool,
      soundName: map['soundName'] as String,
      vibrationActive: map['vibrationActive'] as bool,
      volume: map['volume'] as double,
      showBackgroundForActiveTimer: map['showBackgroundForActiveTimer'] as bool,
    );
  }

  SettingsState copyWith({
    String? skinName,
    bool? playSoundOnLastThreeSeconds,
    String? soundName,
    bool? vibrationActive,
    double? volume,
    bool? showBackgroundForActiveTimer,
  }) {
    return SettingsState(
      skinName: skinName ?? this.skinName,
      playSoundOnLastThreeSeconds:
          playSoundOnLastThreeSeconds ?? this.playSoundOnLastThreeSeconds,
      soundName: soundName ?? this.soundName,
      vibrationActive: vibrationActive ?? this.vibrationActive,
      volume: volume ?? this.volume,
      showBackgroundForActiveTimer:
          showBackgroundForActiveTimer ?? this.showBackgroundForActiveTimer,
    );
  }
}
