import 'package:freezed_annotation/freezed_annotation.dart';

part 'linked_account_model.freezed.dart';
part 'linked_account_model.g.dart';

@freezed
class LinkedAccountModel with _$LinkedAccountModel {
  const factory LinkedAccountModel({
    @JsonKey(
      name: 'account_type',
      required: true,
    )
    required String accountType,
    @JsonKey(
      name: 'account_no',
      required: true,
    )
    required String accountNo,
    @JsonKey(
      name: 'is_default',
      required: true,
      defaultValue: false,
    )
    required bool isDefault,
  }) = _LinkedAccountModel;

  factory LinkedAccountModel.fromJson(Map json) => _$LinkedAccountModelFromJson(
      Map.castFrom<dynamic, dynamic, String, dynamic>(json));
}
