import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:typeform_app/core/data/network/utilities/server_type_transformers.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

@freezed
class WalletModel with _$WalletModel {
  const factory WalletModel({
    @JsonKey(
      name: 'wallet_id',
      required: true,
    )
    required String walletId,
    @JsonKey(
      name: 'country_code',
      required: true,
    )
    required String countryCode,
    @JsonKey(
      name: 'currency_code',
      required: true,
    )
    required String currencyCode,
    @JsonKey(
      name: 'current_balance',
      required: true,
      fromJson: ServerTypeTransformer.toDoubleFromServer,
      defaultValue: 0.0,
    )
    required double currentBalance,
    @JsonKey(
      name: 'available_balance',
      required: true,
      fromJson: ServerTypeTransformer.toDoubleFromServer,
      defaultValue: 0.0,
    )
    required double availableBalance,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map json) => _$WalletModelFromJson(
      Map.castFrom<dynamic, dynamic, String, dynamic>(json));
}
