// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linked_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LinkedAccountModelImpl _$$LinkedAccountModelImplFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['account_type', 'account_no', 'is_default'],
  );
  return _$LinkedAccountModelImpl(
    accountType: json['account_type'] as String,
    accountNo: json['account_no'] as String,
    isDefault: json['is_default'] as bool? ?? false,
  );
}

Map<String, dynamic> _$$LinkedAccountModelImplToJson(
        _$LinkedAccountModelImpl instance) =>
    <String, dynamic>{
      'account_type': instance.accountType,
      'account_no': instance.accountNo,
      'is_default': instance.isDefault,
    };
