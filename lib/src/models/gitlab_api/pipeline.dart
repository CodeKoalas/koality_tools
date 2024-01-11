import 'package:freezed_annotation/freezed_annotation.dart';

part 'pipeline.freezed.dart';
part 'pipeline.g.dart';

@freezed
class GitlabPipeline with _$GitlabPipeline {
  const GitlabPipeline._();
  const factory GitlabPipeline({
    required String id,
    required String sha,
    required String ref,
    required String status,
    @Default('') String webUrl,
  }) = _GitlabPipeline;

  factory GitlabPipeline.fromJson(Map<String, dynamic> json) => _$GitlabPipelineFromJson(json);
}
