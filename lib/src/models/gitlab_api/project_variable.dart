import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_variable.freezed.dart';
part 'project_variable.g.dart';

// ignore: constant_identifier_names
enum GitlabProjectVariableType { env_var, file }

/// A model representing a Gitlab project variable.
@freezed
class GitlabProjectVariable with _$GitlabProjectVariable {
  const GitlabProjectVariable._();
  const factory GitlabProjectVariable({
    required String key,
    required String value,
    @Default(false) bool protected,
    @Default(false) bool masked,
    @Default(false) bool raw,
    @Default('*') String environmentScope,
    GitlabProjectVariableType? variableType,
    String? description,
  }) = _GitlabProjectVariable;

  factory GitlabProjectVariable.fromJson(Map<String, dynamic> json) => _$GitlabProjectVariableFromJson(json);
}
