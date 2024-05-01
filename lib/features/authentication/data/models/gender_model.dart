import 'package:freezed_annotation/freezed_annotation.dart';

part 'gender_model.freezed.dart';
part 'gender_model.g.dart';

@freezed
class GenderModel with _$GenderModel {
  const factory GenderModel({
    required int id,
    required String name,
  }) = _GenderModel;

  factory GenderModel.fromJson(Map json) => _$GenderModelFromJson(
      Map.castFrom<dynamic, dynamic, String, dynamic>(json));
}
