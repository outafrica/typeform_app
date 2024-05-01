import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:typeform_app/features/home/data/models/question_model.dart';

part 'form_model.freezed.dart';
part 'form_model.g.dart';

@freezed
class FormModel with _$FormModel {
  const factory FormModel({
    required int id,
    required String title,
    required String description,
    @JsonKey(
      name: 'questions',
      required: false,
      fromJson: _questionsFromJson,
    )
    required List<QuestionModel> questions,
  }) = _FormModel;

  factory FormModel.fromJson(Map json) => _$FormModelFromJson(
      Map.castFrom<dynamic, dynamic, String, dynamic>(json));
}

List<QuestionModel> _questionsFromJson(List question) => question
    .where((e) => e != null)
    .map((e) => QuestionModel.fromJson(
          Map.castFrom<dynamic, dynamic, String, dynamic>(e as Map),
        ))
    .toList();
