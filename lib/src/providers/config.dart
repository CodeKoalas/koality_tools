import 'dart:convert';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config.freezed.dart';
part 'config.g.dart';

@riverpod
FutureOr<KoalityConfig> getKoalityConfig(
  GetKoalityConfigRef ref, {
  required Logger logger,
  String? overrideConfigPath,
}) async {
  if (overrideConfigPath != null) {
    final data = await File(overrideConfigPath).readAsString();
    final config = jsonDecode(data) as Map<String, dynamic>;
    final kubectlConfig = KubectlConfig.fromJson(config['kubectlConfig'] as Map<String, dynamic>);
    return KoalityConfig(configPath: overrideConfigPath, kubectlConfig: kubectlConfig);
  }

  /// Let's first setup a config file for some sensitive data so it's not
  /// contained in the repo. Depending on whether we are on Linux/MacOS/Windows
  /// we will store the file in different places.
  ///
  /// We should follow conventions for each platform and put files where they are
  /// readable and writable by this app.
  late final File configFile;
  // No config path was passed, so decide the path based on Platform.
  if (Platform.isLinux) {
    // Linux
    configFile = File('${Platform.environment['HOME']}/.koality_config.json');
  } else if (Platform.isMacOS) {
    // MacOS
    configFile = File('${Platform.environment['HOME']}/.koality_config.json');
  } else if (Platform.isWindows) {
    // Windows
    configFile = File('${Platform.environment['APPDATA']}/.koality_config.json');
  } else {
    // Unknown
    configFile = File('${Platform.environment['HOME']}/.koality_config.json');
  }

  // Make sure the file exists.
  if (!configFile.existsSync()) {
    configFile
      ..createSync(recursive: true)
      ..writeAsStringSync('{"configPath": "${configFile.path}", "kubectlConfig": {}}');
  }

  final data = await configFile.readAsString();
  final config = jsonDecode(data) as Map<String, dynamic>;

  logger.info('Config file location: ${configFile.path}/.koality_config.json');

  return KoalityConfig.fromJson(config);
}

@freezed
class KoalityConfig with _$KoalityConfig {
  const factory KoalityConfig({
    required String configPath,
    @Default(KubectlConfig()) KubectlConfig kubectlConfig,
  }) = _KoalityConfig;
  const KoalityConfig._();

  factory KoalityConfig.fromJson(Map<String, dynamic> json) => _$KoalityConfigFromJson(json);
}

@freezed
class KubectlConfig with _$KubectlConfig {
  const factory KubectlConfig({
    @Default('gitlab-managed-apps') String defaultNamespace,
  }) = _KubectlConfig;
  const KubectlConfig._();

  factory KubectlConfig.fromJson(Map<String, dynamic> json) => _$KubectlConfigFromJson(json);
}
