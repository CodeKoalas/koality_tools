// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GitlabCommitImpl _$$GitlabCommitImplFromJson(Map<String, dynamic> json) => _$GitlabCommitImpl(
      id: json['id'] as String,
      shortId: json['shortId'] as String,
      title: json['title'] as String? ?? '',
      message: json['message'] as String? ?? '',
      parentIds: (json['parentIds'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const <String>[],
      authorName: json['authorName'] as String? ?? '',
      authorEmail: json['authorEmail'] as String? ?? '',
      authoredDate: json['authoredDate'] as String? ?? '',
      committerName: json['committerName'] as String? ?? '',
      committerEmail: json['committerEmail'] as String? ?? '',
      committedDate: json['committedDate'] as String? ?? '',
    );

Map<String, dynamic> _$$GitlabCommitImplToJson(_$GitlabCommitImpl instance) => <String, dynamic>{
      'id': instance.id,
      'shortId': instance.shortId,
      'title': instance.title,
      'message': instance.message,
      'parentIds': instance.parentIds,
      'authorName': instance.authorName,
      'authorEmail': instance.authorEmail,
      'authoredDate': instance.authoredDate,
      'committerName': instance.committerName,
      'committerEmail': instance.committerEmail,
      'committedDate': instance.committedDate,
    };
