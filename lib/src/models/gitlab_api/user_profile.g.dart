// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GitlabUserProfileImpl _$$GitlabUserProfileImplFromJson(Map<String, dynamic> json) => _$GitlabUserProfileImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      state: $enumDecodeNullable(_$GitlabUserProfileStateEnumMap, json['state']),
      avatarUrl: json['avatarUrl'] as String?,
      webUrl: json['webUrl'] as String?,
      createdAt: json['createdAt'] as String?,
      bio: json['bio'] as String?,
      location: json['location'] as String?,
      publicEmail: json['publicEmail'] as String? ?? '',
      skype: json['skype'] as String? ?? '',
      linkedin: json['linkedin'] as String? ?? '',
      twitter: json['twitter'] as String? ?? '',
      websiteUrl: json['websiteUrl'] as String? ?? '',
    );

Map<String, dynamic> _$$GitlabUserProfileImplToJson(_$GitlabUserProfileImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'state': _$GitlabUserProfileStateEnumMap[instance.state],
      'avatarUrl': instance.avatarUrl,
      'webUrl': instance.webUrl,
      'createdAt': instance.createdAt,
      'bio': instance.bio,
      'location': instance.location,
      'publicEmail': instance.publicEmail,
      'skype': instance.skype,
      'linkedin': instance.linkedin,
      'twitter': instance.twitter,
      'websiteUrl': instance.websiteUrl,
    };

const _$GitlabUserProfileStateEnumMap = {
  GitlabUserProfileState.active: 'active',
  GitlabUserProfileState.blocked: 'blocked',
};
