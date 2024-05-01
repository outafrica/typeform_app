import 'package:freezed_annotation/freezed_annotation.dart';

part 'option_type_model.freezed.dart';
part 'option_type_model.g.dart';

@freezed
class OptionTypeModel with _$OptionTypeModel {
  const factory OptionTypeModel({
    required int id,
    @JsonKey(
      name: 'name',
      required: false,
      defaultValue: OptionType.RadioButton,
      fromJson: _optionTypeFromJson,
    )
    required OptionType optionType,
    String? description,
  }) = _OptionTypeModel;

  factory OptionTypeModel.fromJson(Map json) => _$OptionTypeModelFromJson(
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

enum OptionType {
  RadioButton,
  Checkbox,
  Integer,
  Date,
  Text,
}
