// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name', required: false)
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name', required: false)
  String get lastName => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth', required: false)
  String? get dob => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_number', required: false)
  String? get idNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_code', required: false)
  String? get countryCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number', required: false)
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_picture', required: false)
  String? get profilePicture => throw _privateConstructorUsedError;
  WalletModel? get wallet => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'linked_accounts', required: false, fromJson: _accountsFromJson)
  List<LinkedAccountModel>? get linkedAccounts =>
      throw _privateConstructorUsedError;
  @JsonKey(
      name: 'role',
      required: false,
      defaultValue: UserRole.User,
      fromJson: _roleFromJson)
  UserRole get role => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'status',
      required: false,
      defaultValue: UserStatus.Active,
      fromJson: _userStatusFromJson)
  UserStatus get userStatus => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'kyc_status',
      required: false,
      defaultValue: KycStatus.Pending,
      fromJson: _kycStatusFromJson)
  KycStatus get kycStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'kyc_verification_url', required: false)
  String get kycVerificationLink => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String id,
      String username,
      @JsonKey(name: 'first_name', required: false) String firstName,
      @JsonKey(name: 'last_name', required: false) String lastName,
      String gender,
      String email,
      @JsonKey(name: 'date_of_birth', required: false) String? dob,
      @JsonKey(name: 'id_number', required: false) String? idNumber,
      @JsonKey(name: 'country_code', required: false) String? countryCode,
      @JsonKey(name: 'phone_number', required: false) String phoneNumber,
      @JsonKey(name: 'profile_picture', required: false) String? profilePicture,
      WalletModel? wallet,
      @JsonKey(
          name: 'linked_accounts', required: false, fromJson: _accountsFromJson)
      List<LinkedAccountModel>? linkedAccounts,
      @JsonKey(
          name: 'role',
          required: false,
          defaultValue: UserRole.User,
          fromJson: _roleFromJson)
      UserRole role,
      @JsonKey(
          name: 'status',
          required: false,
          defaultValue: UserStatus.Active,
          fromJson: _userStatusFromJson)
      UserStatus userStatus,
      @JsonKey(
          name: 'kyc_status',
          required: false,
          defaultValue: KycStatus.Pending,
          fromJson: _kycStatusFromJson)
      KycStatus kycStatus,
      @JsonKey(name: 'kyc_verification_url', required: false)
      String kycVerificationLink,
      String token});

  $WalletModelCopyWith<$Res>? get wallet;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? gender = null,
    Object? email = null,
    Object? dob = freezed,
    Object? idNumber = freezed,
    Object? countryCode = freezed,
    Object? phoneNumber = null,
    Object? profilePicture = freezed,
    Object? wallet = freezed,
    Object? linkedAccounts = freezed,
    Object? role = null,
    Object? userStatus = null,
    Object? kycStatus = null,
    Object? kycVerificationLink = null,
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      idNumber: freezed == idNumber
          ? _value.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletModel?,
      linkedAccounts: freezed == linkedAccounts
          ? _value.linkedAccounts
          : linkedAccounts // ignore: cast_nullable_to_non_nullable
              as List<LinkedAccountModel>?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      userStatus: null == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as UserStatus,
      kycStatus: null == kycStatus
          ? _value.kycStatus
          : kycStatus // ignore: cast_nullable_to_non_nullable
              as KycStatus,
      kycVerificationLink: null == kycVerificationLink
          ? _value.kycVerificationLink
          : kycVerificationLink // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletModelCopyWith<$Res>? get wallet {
    if (_value.wallet == null) {
      return null;
    }

    return $WalletModelCopyWith<$Res>(_value.wallet!, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String username,
      @JsonKey(name: 'first_name', required: false) String firstName,
      @JsonKey(name: 'last_name', required: false) String lastName,
      String gender,
      String email,
      @JsonKey(name: 'date_of_birth', required: false) String? dob,
      @JsonKey(name: 'id_number', required: false) String? idNumber,
      @JsonKey(name: 'country_code', required: false) String? countryCode,
      @JsonKey(name: 'phone_number', required: false) String phoneNumber,
      @JsonKey(name: 'profile_picture', required: false) String? profilePicture,
      WalletModel? wallet,
      @JsonKey(
          name: 'linked_accounts', required: false, fromJson: _accountsFromJson)
      List<LinkedAccountModel>? linkedAccounts,
      @JsonKey(
          name: 'role',
          required: false,
          defaultValue: UserRole.User,
          fromJson: _roleFromJson)
      UserRole role,
      @JsonKey(
          name: 'status',
          required: false,
          defaultValue: UserStatus.Active,
          fromJson: _userStatusFromJson)
      UserStatus userStatus,
      @JsonKey(
          name: 'kyc_status',
          required: false,
          defaultValue: KycStatus.Pending,
          fromJson: _kycStatusFromJson)
      KycStatus kycStatus,
      @JsonKey(name: 'kyc_verification_url', required: false)
      String kycVerificationLink,
      String token});

  @override
  $WalletModelCopyWith<$Res>? get wallet;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? gender = null,
    Object? email = null,
    Object? dob = freezed,
    Object? idNumber = freezed,
    Object? countryCode = freezed,
    Object? phoneNumber = null,
    Object? profilePicture = freezed,
    Object? wallet = freezed,
    Object? linkedAccounts = freezed,
    Object? role = null,
    Object? userStatus = null,
    Object? kycStatus = null,
    Object? kycVerificationLink = null,
    Object? token = null,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      idNumber: freezed == idNumber
          ? _value.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletModel?,
      linkedAccounts: freezed == linkedAccounts
          ? _value._linkedAccounts
          : linkedAccounts // ignore: cast_nullable_to_non_nullable
              as List<LinkedAccountModel>?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      userStatus: null == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as UserStatus,
      kycStatus: null == kycStatus
          ? _value.kycStatus
          : kycStatus // ignore: cast_nullable_to_non_nullable
              as KycStatus,
      kycVerificationLink: null == kycVerificationLink
          ? _value.kycVerificationLink
          : kycVerificationLink // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {required this.id,
      required this.username,
      @JsonKey(name: 'first_name', required: false) required this.firstName,
      @JsonKey(name: 'last_name', required: false) required this.lastName,
      required this.gender,
      required this.email,
      @JsonKey(name: 'date_of_birth', required: false) this.dob,
      @JsonKey(name: 'id_number', required: false) this.idNumber,
      @JsonKey(name: 'country_code', required: false) this.countryCode,
      @JsonKey(name: 'phone_number', required: false) required this.phoneNumber,
      @JsonKey(name: 'profile_picture', required: false) this.profilePicture,
      this.wallet,
      @JsonKey(
          name: 'linked_accounts', required: false, fromJson: _accountsFromJson)
      final List<LinkedAccountModel>? linkedAccounts,
      @JsonKey(
          name: 'role',
          required: false,
          defaultValue: UserRole.User,
          fromJson: _roleFromJson)
      required this.role,
      @JsonKey(
          name: 'status',
          required: false,
          defaultValue: UserStatus.Active,
          fromJson: _userStatusFromJson)
      required this.userStatus,
      @JsonKey(
          name: 'kyc_status',
          required: false,
          defaultValue: KycStatus.Pending,
          fromJson: _kycStatusFromJson)
      required this.kycStatus,
      @JsonKey(name: 'kyc_verification_url', required: false)
      required this.kycVerificationLink,
      required this.token})
      : _linkedAccounts = linkedAccounts;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  @JsonKey(name: 'first_name', required: false)
  final String firstName;
  @override
  @JsonKey(name: 'last_name', required: false)
  final String lastName;
  @override
  final String gender;
  @override
  final String email;
  @override
  @JsonKey(name: 'date_of_birth', required: false)
  final String? dob;
  @override
  @JsonKey(name: 'id_number', required: false)
  final String? idNumber;
  @override
  @JsonKey(name: 'country_code', required: false)
  final String? countryCode;
  @override
  @JsonKey(name: 'phone_number', required: false)
  final String phoneNumber;
  @override
  @JsonKey(name: 'profile_picture', required: false)
  final String? profilePicture;
  @override
  final WalletModel? wallet;
  final List<LinkedAccountModel>? _linkedAccounts;
  @override
  @JsonKey(
      name: 'linked_accounts', required: false, fromJson: _accountsFromJson)
  List<LinkedAccountModel>? get linkedAccounts {
    final value = _linkedAccounts;
    if (value == null) return null;
    if (_linkedAccounts is EqualUnmodifiableListView) return _linkedAccounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(
      name: 'role',
      required: false,
      defaultValue: UserRole.User,
      fromJson: _roleFromJson)
  final UserRole role;
  @override
  @JsonKey(
      name: 'status',
      required: false,
      defaultValue: UserStatus.Active,
      fromJson: _userStatusFromJson)
  final UserStatus userStatus;
  @override
  @JsonKey(
      name: 'kyc_status',
      required: false,
      defaultValue: KycStatus.Pending,
      fromJson: _kycStatusFromJson)
  final KycStatus kycStatus;
  @override
  @JsonKey(name: 'kyc_verification_url', required: false)
  final String kycVerificationLink;
  @override
  final String token;

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, firstName: $firstName, lastName: $lastName, gender: $gender, email: $email, dob: $dob, idNumber: $idNumber, countryCode: $countryCode, phoneNumber: $phoneNumber, profilePicture: $profilePicture, wallet: $wallet, linkedAccounts: $linkedAccounts, role: $role, userStatus: $userStatus, kycStatus: $kycStatus, kycVerificationLink: $kycVerificationLink, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.idNumber, idNumber) ||
                other.idNumber == idNumber) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            const DeepCollectionEquality()
                .equals(other._linkedAccounts, _linkedAccounts) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.userStatus, userStatus) ||
                other.userStatus == userStatus) &&
            (identical(other.kycStatus, kycStatus) ||
                other.kycStatus == kycStatus) &&
            (identical(other.kycVerificationLink, kycVerificationLink) ||
                other.kycVerificationLink == kycVerificationLink) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      firstName,
      lastName,
      gender,
      email,
      dob,
      idNumber,
      countryCode,
      phoneNumber,
      profilePicture,
      wallet,
      const DeepCollectionEquality().hash(_linkedAccounts),
      role,
      userStatus,
      kycStatus,
      kycVerificationLink,
      token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final String id,
      required final String username,
      @JsonKey(name: 'first_name', required: false)
      required final String firstName,
      @JsonKey(name: 'last_name', required: false)
      required final String lastName,
      required final String gender,
      required final String email,
      @JsonKey(name: 'date_of_birth', required: false) final String? dob,
      @JsonKey(name: 'id_number', required: false) final String? idNumber,
      @JsonKey(name: 'country_code', required: false) final String? countryCode,
      @JsonKey(name: 'phone_number', required: false)
      required final String phoneNumber,
      @JsonKey(name: 'profile_picture', required: false)
      final String? profilePicture,
      final WalletModel? wallet,
      @JsonKey(
          name: 'linked_accounts', required: false, fromJson: _accountsFromJson)
      final List<LinkedAccountModel>? linkedAccounts,
      @JsonKey(
          name: 'role',
          required: false,
          defaultValue: UserRole.User,
          fromJson: _roleFromJson)
      required final UserRole role,
      @JsonKey(
          name: 'status',
          required: false,
          defaultValue: UserStatus.Active,
          fromJson: _userStatusFromJson)
      required final UserStatus userStatus,
      @JsonKey(
          name: 'kyc_status',
          required: false,
          defaultValue: KycStatus.Pending,
          fromJson: _kycStatusFromJson)
      required final KycStatus kycStatus,
      @JsonKey(name: 'kyc_verification_url', required: false)
      required final String kycVerificationLink,
      required final String token}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  @JsonKey(name: 'first_name', required: false)
  String get firstName;
  @override
  @JsonKey(name: 'last_name', required: false)
  String get lastName;
  @override
  String get gender;
  @override
  String get email;
  @override
  @JsonKey(name: 'date_of_birth', required: false)
  String? get dob;
  @override
  @JsonKey(name: 'id_number', required: false)
  String? get idNumber;
  @override
  @JsonKey(name: 'country_code', required: false)
  String? get countryCode;
  @override
  @JsonKey(name: 'phone_number', required: false)
  String get phoneNumber;
  @override
  @JsonKey(name: 'profile_picture', required: false)
  String? get profilePicture;
  @override
  WalletModel? get wallet;
  @override
  @JsonKey(
      name: 'linked_accounts', required: false, fromJson: _accountsFromJson)
  List<LinkedAccountModel>? get linkedAccounts;
  @override
  @JsonKey(
      name: 'role',
      required: false,
      defaultValue: UserRole.User,
      fromJson: _roleFromJson)
  UserRole get role;
  @override
  @JsonKey(
      name: 'status',
      required: false,
      defaultValue: UserStatus.Active,
      fromJson: _userStatusFromJson)
  UserStatus get userStatus;
  @override
  @JsonKey(
      name: 'kyc_status',
      required: false,
      defaultValue: KycStatus.Pending,
      fromJson: _kycStatusFromJson)
  KycStatus get kycStatus;
  @override
  @JsonKey(name: 'kyc_verification_url', required: false)
  String get kycVerificationLink;
  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
