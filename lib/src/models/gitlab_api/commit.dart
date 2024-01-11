import 'package:freezed_annotation/freezed_annotation.dart';

part 'commit.freezed.dart';
part 'commit.g.dart';

@freezed
class GitlabCommit with _$GitlabCommit {
  const GitlabCommit._();
  const factory GitlabCommit({
    required String id,
    required String shortId,
    @Default('') String title,
    @Default('') String message,
    @Default(<String>[]) List<String> parentIds,
    @Default('') String authorName,
    @Default('') String authorEmail,
    @Default('') String authoredDate,
    @Default('') String committerName,
    @Default('') String committerEmail,
    @Default('') String committedDate,
  }) = _GitlabCommit;

  factory GitlabCommit.fromJson(Map<String, dynamic> json) => _$GitlabCommitFromJson(json);
}
