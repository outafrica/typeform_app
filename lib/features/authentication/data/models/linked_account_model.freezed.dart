// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'linked_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LinkedAccountModel _$LinkedAccountModelFromJson(Map<String, dynamic> json) {
  return _LinkedAccountModel.fromJson(json);
}

/// @nodoc
mixin _$LinkedAccountModel {
  @JsonKey(name: 'account_type', required: true)
  String get accountType => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_no', required: true)
  String get accountNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_default', required: true, defaultValue: false)
  bool get isDefault => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinkedAccountModelCopyWith<LinkedAccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkedAccountModelCopyWith<$Res> {
  factory $LinkedAccountModelCopyWith(
          LinkedAccountModel value, $Res Function(LinkedAccountModel) then) =
      _$LinkedAccountModelCopyWithImpl<$Res, LinkedAccountModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'account_type', required: true) String accountType,
      @JsonKey(name: 'account_no', required: true) String accountNo,
      @JsonKey(name: 'is_default', required: true, defaultValue: false)
      bool isDefault});
}

/// @nodoc
class _$LinkedAccountModelCopyWithImpl<$Res, $Val extends LinkedAccountModel>
    implements $LinkedAccountModelCopyWith<$Res> {
  _$LinkedAccountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountType = null,
    Object? accountNo = null,
    Object? isDefault = null,
  }) {
    return _then(_value.copyWith(
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String,
      accountNo: null == accountNo
          ? _value.accountNo
          : accountNo // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LinkedAccountModelImplCopyWith<$Res>
    implements $LinkedAccountModelCopyWith<$Res> {
  factory _$$LinkedAccountModelImplCopyWith(_$LinkedAccountModelImpl value,
          $Res Function(_$LinkedAccountModelImpl) then) =
      __$$LinkedAccountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'account_type', required: true) String accountType,
      @JsonKey(name: 'account_no', required: true) String accountNo,
      @JsonKey(name: 'is_default', required: true, defaultValue: false)
      bool isDefault});
}

/// @nodoc
class __$$LinkedAccountModelImplCopyWithImpl<$Res>
    extends _$LinkedAccountModelCopyWithImpl<$Res, _$LinkedAccountModelImpl>
    implements _$$LinkedAccountModelImplCopyWith<$Res> {
  __$$LinkedAccountModelImplCopyWithImpl(_$LinkedAccountModelImpl _value,
      $Res Function(_$LinkedAccountModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountType = null,
    Object? accountNo = null,
    Object? isDefault = null,
  }) {
    return _then(_$LinkedAccountModelImpl(
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String,
      accountNo: null == accountNo
          ? _value.accountNo
          : accountNo // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LinkedAccountModelImpl implements _LinkedAccountModel {
  const _$LinkedAccountModelImpl(
      {@JsonKey(name: 'account_type', required: true) required this.accountType,
      @JsonKey(name: 'account_no', required: true) required this.accountNo,
      @JsonKey(name: 'is_default', required: true, defaultValue: false)
      required this.isDefault});

  factory _$LinkedAccountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinkedAccountModelImplFromJson(json);

  @override
  @JsonKey(name: 'account_type', required: true)
  final String accountType;
  @override
  @JsonKey(name: 'account_no', required: true)
  final String accountNo;
  @override
  @JsonKey(name: 'is_default', required: true, defaultValue: false)
  final bool isDefault;

  @override
  String toString() {
    return 'LinkedAccountModel(accountType: $accountType, accountNo: $accountNo, isDefault: $isDefault)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinkedAccountModelImpl &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.accountNo, accountNo) ||
                other.accountNo == accountNo) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accountType, accountNo, isDefault);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkedAccountModelImplCopyWith<_$LinkedAccountModelImpl> get copyWith =>
      __$$LinkedAccountModelImplCopyWithImpl<_$LinkedAccountModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LinkedAccountModelImplToJson(
      this,
    );
  }
}

abstract class _LinkedAccountModel implements LinkedAccountModel {
  const factory _LinkedAccountModel(
      {@JsonKey(name: 'account_type', required: true)
      required final String accountType,
      @JsonKey(name: 'account_no', required: true)
      required final String accountNo,
      @JsonKey(name: 'is_default', required: true, defaultValue: false)
      required final bool isDefault}) = _$LinkedAccountModelImpl;

  factory _LinkedAccountModel.fromJson(Map<String, dynamic> json) =
      _$LinkedAccountModelImpl.fromJson;

  @override
  @JsonKey(name: 'account_type', required: true)
  String get accountType;
  @override
  @JsonKey(name: 'account_no', required: true)
  String get accountNo;
  @override
  @JsonKey(name: 'is_default', required: true, defaultValue: false)
  bool get isDefault;
  @override
  @JsonKey(ignore: true)
  _$$LinkedAccountModelImplCopyWith<_$LinkedAccountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
