import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:typeform_app/features/home/data/models/option_model.dart';
import 'package:typeform_app/features/home/data/models/option_type_model.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    required String id,
    @JsonKey(
      name: 'form_id',
      required: true,
    )
    required int formId,
    @JsonKey(
      name: 'question_category',
      required: true,
    )
    required String questionCategory,
    required String question,
    @JsonKey(
      name: 'option_type',
      required: true,
      defaultValue: OptionType.RadioButton,
      fromJson: _optionTypeFromJson,
    )
    required OptionType optionType,
    required List<OptionModel> options,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map json) => _$QuestionModelFromJson(
      Map.castFrom<dynamic, dynamic, String, dynamic>(json));
}

OptionType _optionTypeFromJson(String json) => json == 'Radio Button'
    ? OptionType.RadioButton
    : json == 'Checkbox'
        ? OptionType.Checkbox
        : json == 'Integer'
            ? OptionType.Integer
            : json == 'Date'
                ? OptionType.Date
                : OptionType.Text;
