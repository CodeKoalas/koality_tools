// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';
part 'result.g.dart';

String valueToJsonString(dynamic v) => v.toString();
dynamic fauxValueFromJson(dynamic v) => null;

@Freezed(genericArgumentFactories: true)
class Result<T> with _$Result<T> {
  const Result._();
  const factory Result.success(T data) = ResultSuccess<T>;
  const factory Result.failure(
    @JsonKey(fromJson: fauxValueFromJson, toJson: valueToJsonString) Object? error,
    @JsonKey(includeToJson: false, fromJson: fauxValueFromJson) StackTrace? trace,
  ) = ResultFailure<T>;

  factory Result.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ResultFromJson(json, fromJsonT);

  bool get isSuccess => this is ResultSuccess<T>;
}
