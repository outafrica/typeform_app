import 'package:freezed_annotation/freezed_annotation.dart';

part 'option_model.freezed.dart';
part 'option_model.g.dart';

@freezed
class OptionModel with _$OptionModel {
  const factory OptionModel({
    required String id,
    required String option,
  }) = _OptionModel;

  factory OptionModel.fromJson(Map json) => _$OptionModelFromJson(
      Map.castFrom<dynamic, dynamic, String, dynamic>(json));
}
