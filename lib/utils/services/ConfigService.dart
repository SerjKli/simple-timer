import 'package:flutter/widgets.dart';
import 'package:yaml/yaml.dart';

import '../../route/NavigationService.dart';
import '../assets/ConfigAssets.dart';
import 'LocatorService.dart';

class ConfigService {
  static const developerWebsiteUrl = 'settings_developer_url';

  static Future<YamlMap> _readConfigFile() async {
    final yamlString = await DefaultAssetBundle.of(
      locator<NavigationService>().navigatorKey.currentContext!,
    ).loadString(ConfigAssets.baseConfigs);

    return loadYaml(yamlString);
  }

  static Future<String> getConfig(String configName, [String? defaultValue]) async {
    final YamlMap configs = await _readConfigFile();

    if (configs.isEmpty) {
      throw Exception("Please, check configs file. See an example in "
          "assets/configs/configs_example.yaml");
    }

    /// If [defaultValue] is set, return [defaultValue], otherwise throw an error
    if (!configs.containsKey(configName)) {
      if (defaultValue == null) {
        throw Exception("Config file doesn't have the property '$configName'");
      } else {
        return defaultValue;
      }
    }

    return configs[configName];
  }
}
