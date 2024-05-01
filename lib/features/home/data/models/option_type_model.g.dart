// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OptionTypeModelImpl _$$OptionTypeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OptionTypeModelImpl(
      id: json['id'] as int,
      optionType: json['name'] == null
          ? OptionType.RadioButton
          : _optionTypeFromJson(json['name'] as String),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$OptionTypeModelImplToJson(
        _$OptionTypeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': _$OptionTypeEnumMap[instance.optionType]!,
      'description': instance.description,
    };

const _$OptionTypeEnumMap = {
  OptionType.RadioButton: 'RadioButton',
  OptionType.Checkbox: 'Checkbox',
  OptionType.Integer: 'Integer',
  OptionType.Date: 'Date',
  OptionType.Text: 'Text',
};
