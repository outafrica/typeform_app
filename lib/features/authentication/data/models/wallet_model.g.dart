// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletModelImpl _$$WalletModelImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'wallet_id',
      'country_code',
      'currency_code',
      'current_balance',
      'available_balance'
    ],
  );
  return _$WalletModelImpl(
    walletId: json['wallet_id'] as String,
    countryCode: json['country_code'] as String,
    currencyCode: json['currency_code'] as String,
    currentBalance: json['current_balance'] == null
        ? 0.0
        : ServerTypeTransformer.toDoubleFromServer(json['current_balance']),
    availableBalance: json['available_balance'] == null
        ? 0.0
        : ServerTypeTransformer.toDoubleFromServer(json['available_balance']),
  );
}

Map<String, dynamic> _$$WalletModelImplToJson(_$WalletModelImpl instance) =>
    <String, dynamic>{
      'wallet_id': instance.walletId,
      'country_code': instance.countryCode,
      'currency_code': instance.currencyCode,
      'current_balance': instance.currentBalance,
      'available_balance': instance.availableBalance,
    };
