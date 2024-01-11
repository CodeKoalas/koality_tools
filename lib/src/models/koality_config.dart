import 'package:freezed_annotation/freezed_annotation.dart';

part 'koality_config.freezed.dart';
part 'koality_config.g.dart';

@freezed
class KoalityConfig with _$KoalityConfig {
  const factory KoalityConfig({
    required String configPath,
    @Default(KubectlConfig()) KubectlConfig kubectlConfig,
    @Default(FirebaseConfig()) FirebaseConfig firebaseConfig,
    String? gitlabAccessToken,
    @Default(GitlabConfig()) GitlabConfig gitlabConfig,
  }) = _KoalityConfig;
  const KoalityConfig._();

  factory KoalityConfig.fromJson(Map<String, dynamic> json) => _$KoalityConfigFromJson(json);
}

@freezed
class GitlabConfig with _$GitlabConfig {
  const factory GitlabConfig({
    @Default('https://gitlab.com/api/v4') String gitlabApiUrl,
    @Default('') String gitlabAccessToken,
  }) = _GitlabConfig;

  factory GitlabConfig.fromJson(Map<String, dynamic> json) => _$GitlabConfigFromJson(json);
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
