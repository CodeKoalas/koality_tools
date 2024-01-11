import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

// {
//   "id": 1,
//   "name": "Administrator",
//   "username": "root",
//   "state": "active",
//   "avatar_url": "http://www.gravatar.com/avatar/e64c7d89f26bd1972efa854d13d7dd61?s=80&d=identicon",
//   "web_url": "http://gitlab.dev/root",
//   "created_at": "2015-12-21T13:14:24.077Z",
//   "bio": null,
//   "location": null,
//   "public_email": "",
//   "skype": "",
//   "linkedin": "",
//   "twitter": "",
//   "website_url": "",
//   "organization": null
// }

enum GitlabUserProfileState {
  active,
  blocked,
}

@freezed
class GitlabUserProfile with _$GitlabUserProfile {
  const GitlabUserProfile._();
  const factory GitlabUserProfile({
    required String id,
    required String name,
    required String username,
    GitlabUserProfileState? state,
    String? avatarUrl,
    String? webUrl,
    String? createdAt,
    String? bio,
    String? location,
    @Default('') String publicEmail,
    @Default('') String skype,
    @Default('') String linkedin,
    @Default('') String twitter,
    @Default('') String websiteUrl,
  }) = _GitlabUserProfile;

  factory GitlabUserProfile.fromJson(Map<String, dynamic> json) => _$GitlabUserProfileFromJson(json);
}
