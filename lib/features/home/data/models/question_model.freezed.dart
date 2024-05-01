// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) {
  return _QuestionModel.fromJson(json);
}

/// @nodoc
mixin _$QuestionModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'form_id', required: true)
  int get formId => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_category', required: true)
  String get questionCategory => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'option_type',
      required: true,
      defaultValue: OptionType.RadioButton,
      fromJson: _optionTypeFromJson)
  OptionType get optionType => throw _privateConstructorUsedError;
  List<OptionModel> get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionModelCopyWith<QuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionModelCopyWith<$Res> {
  factory $QuestionModelCopyWith(
          QuestionModel value, $Res Function(QuestionModel) then) =
      _$QuestionModelCopyWithImpl<$Res, QuestionModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'form_id', required: true) int formId,
      @JsonKey(name: 'question_category', required: true)
      String questionCategory,
      String question,
      @JsonKey(
          name: 'option_type',
          required: true,
          defaultValue: OptionType.RadioButton,
          fromJson: _optionTypeFromJson)
      OptionType optionType,
      List<OptionModel> options});
}

/// @nodoc
class _$QuestionModelCopyWithImpl<$Res, $Val extends QuestionModel>
    implements $QuestionModelCopyWith<$Res> {
  _$QuestionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? formId = null,
    Object? questionCategory = null,
    Object? question = null,
    Object? optionType = null,
    Object? options = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      formId: null == formId
          ? _value.formId
          : formId // ignore: cast_nullable_to_non_nullable
              as int,
      questionCategory: null == questionCategory
          ? _value.questionCategory
          : questionCategory // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      optionType: null == optionType
          ? _value.optionType
          : optionType // ignore: cast_nullable_to_non_nullable
              as OptionType,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<OptionModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionModelImplCopyWith<$Res>
    implements $QuestionModelCopyWith<$Res> {
  factory _$$QuestionModelImplCopyWith(
          _$QuestionModelImpl value, $Res Function(_$QuestionModelImpl) then) =
      __$$QuestionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'form_id', required: true) int formId,
      @JsonKey(name: 'question_category', required: true)
      String questionCategory,
      String question,
      @JsonKey(
          name: 'option_type',
          required: true,
          defaultValue: OptionType.RadioButton,
          fromJson: _optionTypeFromJson)
      OptionType optionType,
      List<OptionModel> options});
}

/// @nodoc
class __$$QuestionModelImplCopyWithImpl<$Res>
    extends _$QuestionModelCopyWithImpl<$Res, _$QuestionModelImpl>
    implements _$$QuestionModelImplCopyWith<$Res> {
  __$$QuestionModelImplCopyWithImpl(
      _$QuestionModelImpl _value, $Res Function(_$QuestionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? formId = null,
    Object? questionCategory = null,
    Object? question = null,
    Object? optionType = null,
    Object? options = null,
  }) {
    return _then(_$QuestionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      formId: null == formId
          ? _value.formId
          : formId // ignore: cast_nullable_to_non_nullable
              as int,
      questionCategory: null == questionCategory
          ? _value.questionCategory
          : questionCategory // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      optionType: null == optionType
          ? _value.optionType
          : optionType // ignore: cast_nullable_to_non_nullable
              as OptionType,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<OptionModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionModelImpl implements _QuestionModel {
  const _$QuestionModelImpl(
      {required this.id,
      @JsonKey(name: 'form_id', required: true) required this.formId,
      @JsonKey(name: 'question_category', required: true)
      required this.questionCategory,
      required this.question,
      @JsonKey(
          name: 'option_type',
          required: true,
          defaultValue: OptionType.RadioButton,
          fromJson: _optionTypeFromJson)
      required this.optionType,
      required final List<OptionModel> options})
      : _options = options;

  factory _$QuestionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'form_id', required: true)
  final int formId;
  @override
  @JsonKey(name: 'question_category', required: true)
  final String questionCategory;
  @override
  final String question;
  @override
  @JsonKey(
      name: 'option_type',
      required: true,
      defaultValue: OptionType.RadioButton,
      fromJson: _optionTypeFromJson)
  final OptionType optionType;
  final List<OptionModel> _options;
  @override
  List<OptionModel> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'QuestionModel(id: $id, formId: $formId, questionCategory: $questionCategory, question: $question, optionType: $optionType, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.formId, formId) || other.formId == formId) &&
            (identical(other.questionCategory, questionCategory) ||
                other.questionCategory == questionCategory) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.optionType, optionType) ||
                other.optionType == optionType) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, formId, questionCategory,
      question, optionType, const DeepCollectionEquality().hash(_options));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionModelImplCopyWith<_$QuestionModelImpl> get copyWith =>
      __$$QuestionModelImplCopyWithImpl<_$QuestionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionModelImplToJson(
      this,
    );
  }
}

abstract class _QuestionModel implements QuestionModel {
  const factory _QuestionModel(
      {required final String id,
      @JsonKey(name: 'form_id', required: true) required final int formId,
      @JsonKey(name: 'question_category', required: true)
      required final String questionCategory,
      required final String question,
      @JsonKey(
          name: 'option_type',
          required: true,
          defaultValue: OptionType.RadioButton,
          fromJson: _optionTypeFromJson)
      required final OptionType optionType,
      required final List<OptionModel> options}) = _$QuestionModelImpl;

  factory _QuestionModel.fromJson(Map<String, dynamic> json) =
      _$QuestionModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'form_id', required: true)
  int get formId;
  @override
  @JsonKey(name: 'question_category', required: true)
  String get questionCategory;
  @override
  String get question;
  @override
  @JsonKey(
      name: 'option_type',
      required: true,
      defaultValue: OptionType.RadioButton,
      fromJson: _optionTypeFromJson)
  OptionType get optionType;
  @override
  List<OptionModel> get options;
  @override
  @JsonKey(ignore: true)
  _$$QuestionModelImplCopyWith<_$QuestionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
