import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required int id,
    required String name,
    String? description,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map json) => _$CategoryModelFromJson(
      Map.castFrom<dynamic, dynamic, String, dynamic>(json));
}
