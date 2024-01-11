import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Local imports.
import 'package:koality_tools/src/models/koality_config.dart';
import 'package:koality_tools/src/providers/config_manager.dart';

part 'config.g.dart';

@riverpod
FutureOr<KoalityConfig> getKoalityConfig(
  GetKoalityConfigRef ref, {
  required Logger logger,
  String? overrideConfigPath,
}) async {
  final manager = ref.read(getConfigManagerProvider(logger: logger));
  return manager.getConfig(overrideConfigPath);
}
