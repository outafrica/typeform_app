// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalletModel _$WalletModelFromJson(Map<String, dynamic> json) {
  return _WalletModel.fromJson(json);
}

/// @nodoc
mixin _$WalletModel {
  @JsonKey(name: 'wallet_id', required: true)
  String get walletId => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_code', required: true)
  String get countryCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_code', required: true)
  String get currencyCode => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'current_balance',
      required: true,
      fromJson: ServerTypeTransformer.toDoubleFromServer,
      defaultValue: 0.0)
  double get currentBalance => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'available_balance',
      required: true,
      fromJson: ServerTypeTransformer.toDoubleFromServer,
      defaultValue: 0.0)
  double get availableBalance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletModelCopyWith<WalletModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletModelCopyWith<$Res> {
  factory $WalletModelCopyWith(
          WalletModel value, $Res Function(WalletModel) then) =
      _$WalletModelCopyWithImpl<$Res, WalletModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'wallet_id', required: true) String walletId,
      @JsonKey(name: 'country_code', required: true) String countryCode,
      @JsonKey(name: 'currency_code', required: true) String currencyCode,
      @JsonKey(
          name: 'current_balance',
          required: true,
          fromJson: ServerTypeTransformer.toDoubleFromServer,
          defaultValue: 0.0)
      double currentBalance,
      @JsonKey(
          name: 'available_balance',
          required: true,
          fromJson: ServerTypeTransformer.toDoubleFromServer,
          defaultValue: 0.0)
      double availableBalance});
}

/// @nodoc
class _$WalletModelCopyWithImpl<$Res, $Val extends WalletModel>
    implements $WalletModelCopyWith<$Res> {
  _$WalletModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletId = null,
    Object? countryCode = null,
    Object? currencyCode = null,
    Object? currentBalance = null,
    Object? availableBalance = null,
  }) {
    return _then(_value.copyWith(
      walletId: null == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      currentBalance: null == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double,
      availableBalance: null == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletModelImplCopyWith<$Res>
    implements $WalletModelCopyWith<$Res> {
  factory _$$WalletModelImplCopyWith(
          _$WalletModelImpl value, $Res Function(_$WalletModelImpl) then) =
      __$$WalletModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'wallet_id', required: true) String walletId,
      @JsonKey(name: 'country_code', required: true) String countryCode,
      @JsonKey(name: 'currency_code', required: true) String currencyCode,
      @JsonKey(
          name: 'current_balance',
          required: true,
          fromJson: ServerTypeTransformer.toDoubleFromServer,
          defaultValue: 0.0)
      double currentBalance,
      @JsonKey(
          name: 'available_balance',
          required: true,
          fromJson: ServerTypeTransformer.toDoubleFromServer,
          defaultValue: 0.0)
      double availableBalance});
}

/// @nodoc
class __$$WalletModelImplCopyWithImpl<$Res>
    extends _$WalletModelCopyWithImpl<$Res, _$WalletModelImpl>
    implements _$$WalletModelImplCopyWith<$Res> {
  __$$WalletModelImplCopyWithImpl(
      _$WalletModelImpl _value, $Res Function(_$WalletModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletId = null,
    Object? countryCode = null,
    Object? currencyCode = null,
    Object? currentBalance = null,
    Object? availableBalance = null,
  }) {
    return _then(_$WalletModelImpl(
      walletId: null == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      currentBalance: null == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double,
      availableBalance: null == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletModelImpl implements _WalletModel {
  const _$WalletModelImpl(
      {@JsonKey(name: 'wallet_id', required: true) required this.walletId,
      @JsonKey(name: 'country_code', required: true) required this.countryCode,
      @JsonKey(name: 'currency_code', required: true)
      required this.currencyCode,
      @JsonKey(
          name: 'current_balance',
          required: true,
          fromJson: ServerTypeTransformer.toDoubleFromServer,
          defaultValue: 0.0)
      required this.currentBalance,
      @JsonKey(
          name: 'available_balance',
          required: true,
          fromJson: ServerTypeTransformer.toDoubleFromServer,
          defaultValue: 0.0)
      required this.availableBalance});

  factory _$WalletModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletModelImplFromJson(json);

  @override
  @JsonKey(name: 'wallet_id', required: true)
  final String walletId;
  @override
  @JsonKey(name: 'country_code', required: true)
  final String countryCode;
  @override
  @JsonKey(name: 'currency_code', required: true)
  final String currencyCode;
  @override
  @JsonKey(
      name: 'current_balance',
      required: true,
      fromJson: ServerTypeTransformer.toDoubleFromServer,
      defaultValue: 0.0)
  final double currentBalance;
  @override
  @JsonKey(
      name: 'available_balance',
      required: true,
      fromJson: ServerTypeTransformer.toDoubleFromServer,
      defaultValue: 0.0)
  final double availableBalance;

  @override
  String toString() {
    return 'WalletModel(walletId: $walletId, countryCode: $countryCode, currencyCode: $currencyCode, currentBalance: $currentBalance, availableBalance: $availableBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletModelImpl &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            (identical(other.availableBalance, availableBalance) ||
                other.availableBalance == availableBalance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, walletId, countryCode,
      currencyCode, currentBalance, availableBalance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletModelImplCopyWith<_$WalletModelImpl> get copyWith =>
      __$$WalletModelImplCopyWithImpl<_$WalletModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletModelImplToJson(
      this,
    );
  }
}

abstract class _WalletModel implements WalletModel {
  const factory _WalletModel(
      {@JsonKey(name: 'wallet_id', required: true)
      required final String walletId,
      @JsonKey(name: 'country_code', required: true)
      required final String countryCode,
      @JsonKey(name: 'currency_code', required: true)
      required final String currencyCode,
      @JsonKey(
          name: 'current_balance',
          required: true,
          fromJson: ServerTypeTransformer.toDoubleFromServer,
          defaultValue: 0.0)
      required final double currentBalance,
      @JsonKey(
          name: 'available_balance',
          required: true,
          fromJson: ServerTypeTransformer.toDoubleFromServer,
          defaultValue: 0.0)
      required final double availableBalance}) = _$WalletModelImpl;

  factory _WalletModel.fromJson(Map<String, dynamic> json) =
      _$WalletModelImpl.fromJson;

  @override
  @JsonKey(name: 'wallet_id', required: true)
  String get walletId;
  @override
  @JsonKey(name: 'country_code', required: true)
  String get countryCode;
  @override
  @JsonKey(name: 'currency_code', required: true)
  String get currencyCode;
  @override
  @JsonKey(
      name: 'current_balance',
      required: true,
      fromJson: ServerTypeTransformer.toDoubleFromServer,
      defaultValue: 0.0)
  double get currentBalance;
  @override
  @JsonKey(
      name: 'available_balance',
      required: true,
      fromJson: ServerTypeTransformer.toDoubleFromServer,
      defaultValue: 0.0)
  double get availableBalance;
  @override
  @JsonKey(ignore: true)
  _$$WalletModelImplCopyWith<_$WalletModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
