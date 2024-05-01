// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FormModel _$FormModelFromJson(Map<String, dynamic> json) {
  return _FormModel.fromJson(json);
}

/// @nodoc
mixin _$FormModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'questions', required: false, fromJson: _questionsFromJson)
  List<QuestionModel> get questions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormModelCopyWith<FormModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormModelCopyWith<$Res> {
  factory $FormModelCopyWith(FormModel value, $Res Function(FormModel) then) =
      _$FormModelCopyWithImpl<$Res, FormModel>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      @JsonKey(name: 'questions', required: false, fromJson: _questionsFromJson)
      List<QuestionModel> questions});
}

/// @nodoc
class _$FormModelCopyWithImpl<$Res, $Val extends FormModel>
    implements $FormModelCopyWith<$Res> {
  _$FormModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? questions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormModelImplCopyWith<$Res>
    implements $FormModelCopyWith<$Res> {
  factory _$$FormModelImplCopyWith(
          _$FormModelImpl value, $Res Function(_$FormModelImpl) then) =
      __$$FormModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      @JsonKey(name: 'questions', required: false, fromJson: _questionsFromJson)
      List<QuestionModel> questions});
}

/// @nodoc
class __$$FormModelImplCopyWithImpl<$Res>
    extends _$FormModelCopyWithImpl<$Res, _$FormModelImpl>
    implements _$$FormModelImplCopyWith<$Res> {
  __$$FormModelImplCopyWithImpl(
      _$FormModelImpl _value, $Res Function(_$FormModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? questions = null,
  }) {
    return _then(_$FormModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FormModelImpl implements _FormModel {
  const _$FormModelImpl(
      {required this.id,
      required this.title,
      required this.description,
      @JsonKey(name: 'questions', required: false, fromJson: _questionsFromJson)
      required final List<QuestionModel> questions})
      : _questions = questions;

  factory _$FormModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  final List<QuestionModel> _questions;
  @override
  @JsonKey(name: 'questions', required: false, fromJson: _questionsFromJson)
  List<QuestionModel> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'FormModel(id: $id, title: $title, description: $description, questions: $questions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      const DeepCollectionEquality().hash(_questions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormModelImplCopyWith<_$FormModelImpl> get copyWith =>
      __$$FormModelImplCopyWithImpl<_$FormModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormModelImplToJson(
      this,
    );
  }
}

abstract class _FormModel implements FormModel {
  const factory _FormModel(
      {required final int id,
      required final String title,
      required final String description,
      @JsonKey(name: 'questions', required: false, fromJson: _questionsFromJson)
      required final List<QuestionModel> questions}) = _$FormModelImpl;

  factory _FormModel.fromJson(Map<String, dynamic> json) =
      _$FormModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(name: 'questions', required: false, fromJson: _questionsFromJson)
  List<QuestionModel> get questions;
  @override
  @JsonKey(ignore: true)
  _$$FormModelImplCopyWith<_$FormModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
