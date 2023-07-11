import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:koality_tools/src/providers/config_manager.dart';
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
  final manager = ref.read(getConfigManagerProvider(logger: logger));
  return manager.getConfig(overrideConfigPath);
}

@freezed
class KoalityConfig with _$KoalityConfig {
  const factory KoalityConfig({
    required String configPath,
    @Default(KubectlConfig()) KubectlConfig kubectlConfig,
    @Default(FirebaseConfig()) FirebaseConfig firebaseConfig,
    String? gitlabAccessToken,
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

@freezed
class FirebaseConfig with _$FirebaseConfig {
  const factory FirebaseConfig({
    @Default(false) bool skipDev,
    @Default(false) bool skipProd,
  }) = _FirebaseConfig;
  const FirebaseConfig._();

  factory FirebaseConfig.fromJson(Map<String, dynamic> json) => _$FirebaseConfigFromJson(json);
}
