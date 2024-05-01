// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'option_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OptionTypeModel _$OptionTypeModelFromJson(Map<String, dynamic> json) {
  return _OptionTypeModel.fromJson(json);
}

/// @nodoc
mixin _$OptionTypeModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'name',
      required: false,
      defaultValue: OptionType.RadioButton,
      fromJson: _optionTypeFromJson)
  OptionType get optionType => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OptionTypeModelCopyWith<OptionTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionTypeModelCopyWith<$Res> {
  factory $OptionTypeModelCopyWith(
          OptionTypeModel value, $Res Function(OptionTypeModel) then) =
      _$OptionTypeModelCopyWithImpl<$Res, OptionTypeModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(
          name: 'name',
          required: false,
          defaultValue: OptionType.RadioButton,
          fromJson: _optionTypeFromJson)
      OptionType optionType,
      String? description});
}

/// @nodoc
class _$OptionTypeModelCopyWithImpl<$Res, $Val extends OptionTypeModel>
    implements $OptionTypeModelCopyWith<$Res> {
  _$OptionTypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? optionType = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      optionType: null == optionType
          ? _value.optionType
          : optionType // ignore: cast_nullable_to_non_nullable
              as OptionType,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OptionTypeModelImplCopyWith<$Res>
    implements $OptionTypeModelCopyWith<$Res> {
  factory _$$OptionTypeModelImplCopyWith(_$OptionTypeModelImpl value,
          $Res Function(_$OptionTypeModelImpl) then) =
      __$$OptionTypeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(
          name: 'name',
          required: false,
          defaultValue: OptionType.RadioButton,
          fromJson: _optionTypeFromJson)
      OptionType optionType,
      String? description});
}

/// @nodoc
class __$$OptionTypeModelImplCopyWithImpl<$Res>
    extends _$OptionTypeModelCopyWithImpl<$Res, _$OptionTypeModelImpl>
    implements _$$OptionTypeModelImplCopyWith<$Res> {
  __$$OptionTypeModelImplCopyWithImpl(
      _$OptionTypeModelImpl _value, $Res Function(_$OptionTypeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? optionType = null,
    Object? description = freezed,
  }) {
    return _then(_$OptionTypeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      optionType: null == optionType
          ? _value.optionType
          : optionType // ignore: cast_nullable_to_non_nullable
              as OptionType,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionTypeModelImpl implements _OptionTypeModel {
  const _$OptionTypeModelImpl(
      {required this.id,
      @JsonKey(
          name: 'name',
          required: false,
          defaultValue: OptionType.RadioButton,
          fromJson: _optionTypeFromJson)
      required this.optionType,
      this.description});

  factory _$OptionTypeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionTypeModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(
      name: 'name',
      required: false,
      defaultValue: OptionType.RadioButton,
      fromJson: _optionTypeFromJson)
  final OptionType optionType;
  @override
  final String? description;

  @override
  String toString() {
    return 'OptionTypeModel(id: $id, optionType: $optionType, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionTypeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.optionType, optionType) ||
                other.optionType == optionType) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, optionType, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionTypeModelImplCopyWith<_$OptionTypeModelImpl> get copyWith =>
      __$$OptionTypeModelImplCopyWithImpl<_$OptionTypeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionTypeModelImplToJson(
      this,
    );
  }
}

abstract class _OptionTypeModel implements OptionTypeModel {
  const factory _OptionTypeModel(
      {required final int id,
      @JsonKey(
          name: 'name',
          required: false,
          defaultValue: OptionType.RadioButton,
          fromJson: _optionTypeFromJson)
      required final OptionType optionType,
      final String? description}) = _$OptionTypeModelImpl;

  factory _OptionTypeModel.fromJson(Map<String, dynamic> json) =
      _$OptionTypeModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(
      name: 'name',
      required: false,
      defaultValue: OptionType.RadioButton,
      fromJson: _optionTypeFromJson)
  OptionType get optionType;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$OptionTypeModelImplCopyWith<_$OptionTypeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
