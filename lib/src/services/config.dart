import 'dart:convert';
import 'dart:io';

import 'package:mason_logger/mason_logger.dart';

import 'package:koality_tools/src/providers/config.dart';

class KoalityConfigManager {
  const KoalityConfigManager({required this.logger});

  final Logger logger;

  static const String _configKey = 'koality_config';

  File getConfigFile(String? overrideConfigPath) {
    /// Let's first setup a config file for some sensitive data and config so it's not
    /// contained in the repo. Depending on whether we are on Linux/MacOS/Windows
    /// we will store the file in different places.
    ///
    /// We should follow conventions for each platform and put files where they are
    /// readable and writable by this app.
    late final File configFile;
    if (overrideConfigPath != null) {
      return File(overrideConfigPath);
    } else {
      // No config path was passed, so decide the path based on Platform.
      if (Platform.isLinux) {
        // Linux
        configFile = File('${Platform.environment['HOME']}/.$_configKey.json');
      } else if (Platform.isMacOS) {
        // MacOS
        configFile = File('${Platform.environment['HOME']}/.$_configKey.json');
      } else if (Platform.isWindows) {
        // Windows
        configFile = File('${Platform.environment['APPDATA']}/.$_configKey.json');
      } else {
        // Unknown
        configFile = File('${Platform.environment['HOME']}/.$_configKey.json');
      }
    }

    return configFile;
  }

  Future<void> saveConfig(KoalityConfig config, String? overrideConfigPath) async {
    final configFile = getConfigFile(overrideConfigPath);
    final serialized = config.toJson();
    // Now write to the file.
    try {
      await configFile.writeAsString(jsonEncode(serialized));
    } catch (e) {
      // If we failed writing, let's just print the error and continue.
      logger.err('Failed to write config file: $e');
    }
  }

  Future<KoalityConfig> getConfig(String? overrideConfigPath) async {
    final configFile = getConfigFile(overrideConfigPath);

    // Make sure the file exists.
    if (!configFile.existsSync()) {
      configFile
        ..createSync(recursive: true)
        ..writeAsStringSync(
            '''
{
  "configPath": "${configFile.path}", 
  "kubectlConfig": {}, 
  "gitlabAccessToken": "", 
  "firebase": {
    "skipDev" false,
    "skipProd" false,
  }
}
            ''');
    }

    final data = await configFile.readAsString();
    final config = jsonDecode(data) as Map<String, dynamic>;

    return KoalityConfig.fromJson(config);
  }
}
