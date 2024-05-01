import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_model.freezed.dart';
part 'role_model.g.dart';

@freezed
class RoleModel with _$RoleModel {
  const factory RoleModel({
    required int id,
    required String name,
  }) = _RoleModel;

  factory RoleModel.fromJson(Map json) => _$RoleModelFromJson(
      Map.castFrom<dynamic, dynamic, String, dynamic>(json));
}
