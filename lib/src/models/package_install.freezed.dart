// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_install.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PackageInstallStruct {
  String get packageName => throw _privateConstructorUsedError;
  String get commandName => throw _privateConstructorUsedError;
  PackageTool get tool => throw _privateConstructorUsedError;

  /// Create a copy of PackageInstallStruct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackageInstallStructCopyWith<PackageInstallStruct> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageInstallStructCopyWith<$Res> {
  factory $PackageInstallStructCopyWith(PackageInstallStruct value, $Res Function(PackageInstallStruct) then) =
      _$PackageInstallStructCopyWithImpl<$Res, PackageInstallStruct>;
  @useResult
  $Res call({String packageName, String commandName, PackageTool tool});
}

/// @nodoc
class _$PackageInstallStructCopyWithImpl<$Res, $Val extends PackageInstallStruct>
    implements $PackageInstallStructCopyWith<$Res> {
  _$PackageInstallStructCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PackageInstallStruct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageName = null,
    Object? commandName = null,
    Object? tool = null,
  }) {
    return _then(_value.copyWith(
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      commandName: null == commandName
          ? _value.commandName
          : commandName // ignore: cast_nullable_to_non_nullable
              as String,
      tool: null == tool
          ? _value.tool
          : tool // ignore: cast_nullable_to_non_nullable
              as PackageTool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackageInstallStructImplCopyWith<$Res> implements $PackageInstallStructCopyWith<$Res> {
  factory _$$PackageInstallStructImplCopyWith(
          _$PackageInstallStructImpl value, $Res Function(_$PackageInstallStructImpl) then) =
      __$$PackageInstallStructImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String packageName, String commandName, PackageTool tool});
}

/// @nodoc
class __$$PackageInstallStructImplCopyWithImpl<$Res>
    extends _$PackageInstallStructCopyWithImpl<$Res, _$PackageInstallStructImpl>
    implements _$$PackageInstallStructImplCopyWith<$Res> {
  __$$PackageInstallStructImplCopyWithImpl(
      _$PackageInstallStructImpl _value, $Res Function(_$PackageInstallStructImpl) _then)
      : super(_value, _then);

  /// Create a copy of PackageInstallStruct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageName = null,
    Object? commandName = null,
    Object? tool = null,
  }) {
    return _then(_$PackageInstallStructImpl(
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      commandName: null == commandName
          ? _value.commandName
          : commandName // ignore: cast_nullable_to_non_nullable
              as String,
      tool: null == tool
          ? _value.tool
          : tool // ignore: cast_nullable_to_non_nullable
              as PackageTool,
    ));
  }
}

/// @nodoc

class _$PackageInstallStructImpl extends _PackageInstallStruct {
  const _$PackageInstallStructImpl({required this.packageName, required this.commandName, required this.tool})
      : super._();

  @override
  final String packageName;
  @override
  final String commandName;
  @override
  final PackageTool tool;

  @override
  String toString() {
    return 'PackageInstallStruct(packageName: $packageName, commandName: $commandName, tool: $tool)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackageInstallStructImpl &&
            (identical(other.packageName, packageName) || other.packageName == packageName) &&
            (identical(other.commandName, commandName) || other.commandName == commandName) &&
            (identical(other.tool, tool) || other.tool == tool));
  }

  @override
  int get hashCode => Object.hash(runtimeType, packageName, commandName, tool);

  /// Create a copy of PackageInstallStruct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackageInstallStructImplCopyWith<_$PackageInstallStructImpl> get copyWith =>
      __$$PackageInstallStructImplCopyWithImpl<_$PackageInstallStructImpl>(this, _$identity);
}

abstract class _PackageInstallStruct extends PackageInstallStruct {
  const factory _PackageInstallStruct(
      {required final String packageName,
      required final String commandName,
      required final PackageTool tool}) = _$PackageInstallStructImpl;
  const _PackageInstallStruct._() : super._();

  @override
  String get packageName;
  @override
  String get commandName;
  @override
  PackageTool get tool;

  /// Create a copy of PackageInstallStruct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackageInstallStructImplCopyWith<_$PackageInstallStructImpl> get copyWith => throw _privateConstructorUsedError;
}
