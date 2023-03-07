import 'package:simpletimer/modules/settings/blocks/settings/exports.dart';

import 'base_repository.dart';

class SettingsRepository extends BaseRepository {

   SettingsState settings = const SettingsState();

  void updateSettings(SettingsState newSettings){
    settings = newSettings;
  }

}
