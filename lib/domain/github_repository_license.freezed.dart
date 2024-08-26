// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_repository_license.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RepositoryLicense _$RepositoryLicenseFromJson(Map<String, dynamic> json) {
  return _RepositoryLicense.fromJson(json);
}

/// @nodoc
mixin _$RepositoryLicense {
  @JsonKey(name: 'spdx_id')
  String get spdxId => throw _privateConstructorUsedError;

  /// Serializes this RepositoryLicense to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepositoryLicense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepositoryLicenseCopyWith<RepositoryLicense> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoryLicenseCopyWith<$Res> {
  factory $RepositoryLicenseCopyWith(
          RepositoryLicense value, $Res Function(RepositoryLicense) then) =
      _$RepositoryLicenseCopyWithImpl<$Res, RepositoryLicense>;
  @useResult
  $Res call({@JsonKey(name: 'spdx_id') String spdxId});
}

/// @nodoc
class _$RepositoryLicenseCopyWithImpl<$Res, $Val extends RepositoryLicense>
    implements $RepositoryLicenseCopyWith<$Res> {
  _$RepositoryLicenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepositoryLicense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spdxId = null,
  }) {
    return _then(_value.copyWith(
      spdxId: null == spdxId
          ? _value.spdxId
          : spdxId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepositoryLicenseImplCopyWith<$Res>
    implements $RepositoryLicenseCopyWith<$Res> {
  factory _$$RepositoryLicenseImplCopyWith(_$RepositoryLicenseImpl value,
          $Res Function(_$RepositoryLicenseImpl) then) =
      __$$RepositoryLicenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'spdx_id') String spdxId});
}

/// @nodoc
class __$$RepositoryLicenseImplCopyWithImpl<$Res>
    extends _$RepositoryLicenseCopyWithImpl<$Res, _$RepositoryLicenseImpl>
    implements _$$RepositoryLicenseImplCopyWith<$Res> {
  __$$RepositoryLicenseImplCopyWithImpl(_$RepositoryLicenseImpl _value,
      $Res Function(_$RepositoryLicenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepositoryLicense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spdxId = null,
  }) {
    return _then(_$RepositoryLicenseImpl(
      spdxId: null == spdxId
          ? _value.spdxId
          : spdxId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepositoryLicenseImpl
    with DiagnosticableTreeMixin
    implements _RepositoryLicense {
  const _$RepositoryLicenseImpl(
      {@JsonKey(name: 'spdx_id') required this.spdxId});

  factory _$RepositoryLicenseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepositoryLicenseImplFromJson(json);

  @override
  @JsonKey(name: 'spdx_id')
  final String spdxId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RepositoryLicense(spdxId: $spdxId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RepositoryLicense'))
      ..add(DiagnosticsProperty('spdxId', spdxId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepositoryLicenseImpl &&
            (identical(other.spdxId, spdxId) || other.spdxId == spdxId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, spdxId);

  /// Create a copy of RepositoryLicense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepositoryLicenseImplCopyWith<_$RepositoryLicenseImpl> get copyWith =>
      __$$RepositoryLicenseImplCopyWithImpl<_$RepositoryLicenseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepositoryLicenseImplToJson(
      this,
    );
  }
}

abstract class _RepositoryLicense implements RepositoryLicense {
  const factory _RepositoryLicense(
          {@JsonKey(name: 'spdx_id') required final String spdxId}) =
      _$RepositoryLicenseImpl;

  factory _RepositoryLicense.fromJson(Map<String, dynamic> json) =
      _$RepositoryLicenseImpl.fromJson;

  @override
  @JsonKey(name: 'spdx_id')
  String get spdxId;

  /// Create a copy of RepositoryLicense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepositoryLicenseImplCopyWith<_$RepositoryLicenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
