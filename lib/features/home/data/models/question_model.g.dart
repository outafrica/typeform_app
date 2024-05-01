// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionModelImpl _$$QuestionModelImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['form_id', 'question_category', 'option_type'],
  );
  return _$QuestionModelImpl(
    id: json['id'] as String,
    formId: json['form_id'] as int,
    questionCategory: json['question_category'] as String,
    question: json['question'] as String,
    optionType: json['option_type'] == null
        ? OptionType.RadioButton
        : _optionTypeFromJson(json['option_type'] as String),
    options: (json['options'] as List<dynamic>)
        .map((e) => OptionModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$$QuestionModelImplToJson(_$QuestionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'form_id': instance.formId,
      'question_category': instance.questionCategory,
      'question': instance.question,
      'option_type': _$OptionTypeEnumMap[instance.optionType]!,
      'options': instance.options.map((e) => e.toJson()).toList(),
    };

const _$OptionTypeEnumMap = {
  OptionType.RadioButton: 'RadioButton',
  OptionType.Checkbox: 'Checkbox',
  OptionType.Integer: 'Integer',
  OptionType.Date: 'Date',
  OptionType.Text: 'Text',
};
