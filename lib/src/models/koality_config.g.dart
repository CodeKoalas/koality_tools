// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'koality_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KoalityConfigImpl _$$KoalityConfigImplFromJson(Map<String, dynamic> json) => _$KoalityConfigImpl(
      configPath: json['configPath'] as String,
      kubectlConfig: json['kubectlConfig'] == null
          ? const KubectlConfig()
          : KubectlConfig.fromJson(json['kubectlConfig'] as Map<String, dynamic>),
      firebaseConfig: json['firebaseConfig'] == null
          ? const FirebaseConfig()
          : FirebaseConfig.fromJson(json['firebaseConfig'] as Map<String, dynamic>),
      gitlabAccessToken: json['gitlabAccessToken'] as String?,
      gitlabConfig: json['gitlabConfig'] == null
          ? const GitlabConfig()
          : GitlabConfig.fromJson(json['gitlabConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$KoalityConfigImplToJson(_$KoalityConfigImpl instance) => <String, dynamic>{
      'configPath': instance.configPath,
      'kubectlConfig': instance.kubectlConfig,
      'firebaseConfig': instance.firebaseConfig,
      'gitlabAccessToken': instance.gitlabAccessToken,
      'gitlabConfig': instance.gitlabConfig,
    };

_$GitlabConfigImpl _$$GitlabConfigImplFromJson(Map<String, dynamic> json) => _$GitlabConfigImpl(
      gitlabApiUrl: json['gitlabApiUrl'] as String? ?? 'https://gitlab.com/api/v4',
      gitlabAccessToken: json['gitlabAccessToken'] as String? ?? '',
    );

Map<String, dynamic> _$$GitlabConfigImplToJson(_$GitlabConfigImpl instance) => <String, dynamic>{
      'gitlabApiUrl': instance.gitlabApiUrl,
      'gitlabAccessToken': instance.gitlabAccessToken,
    };

_$KubectlConfigImpl _$$KubectlConfigImplFromJson(Map<String, dynamic> json) => _$KubectlConfigImpl(
      defaultNamespace: json['defaultNamespace'] as String? ?? 'gitlab-managed-apps',
    );

Map<String, dynamic> _$$KubectlConfigImplToJson(_$KubectlConfigImpl instance) => <String, dynamic>{
      'defaultNamespace': instance.defaultNamespace,
    };

_$FirebaseConfigImpl _$$FirebaseConfigImplFromJson(Map<String, dynamic> json) => _$FirebaseConfigImpl(
      skipDev: json['skipDev'] as bool? ?? false,
      skipProd: json['skipProd'] as bool? ?? false,
    );

Map<String, dynamic> _$$FirebaseConfigImplToJson(_$FirebaseConfigImpl instance) => <String, dynamic>{
      'skipDev': instance.skipDev,
      'skipProd': instance.skipProd,
    };
