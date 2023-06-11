import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:koality_tools/src/services/config.dart';

part 'config_manager.g.dart';

@riverpod
KoalityConfigManager getConfigManager(GetConfigManagerRef ref, {required Logger logger}) {
  return KoalityConfigManager(logger: logger);
}
