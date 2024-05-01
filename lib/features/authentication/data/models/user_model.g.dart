// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      gender: json['gender'] as String,
      email: json['email'] as String,
      dob: json['date_of_birth'] as String?,
      idNumber: json['id_number'] as String?,
      countryCode: json['country_code'] as String?,
      phoneNumber: json['phone_number'] as String,
      profilePicture: json['profile_picture'] as String?,
      wallet: json['wallet'] == null
          ? null
          : WalletModel.fromJson(json['wallet'] as Map<String, dynamic>),
      linkedAccounts: _accountsFromJson(json['linked_accounts'] as List),
      role: json['role'] == null
          ? UserRole.User
          : _roleFromJson(json['role'] as String),
      userStatus: json['status'] == null
          ? UserStatus.Active
          : _userStatusFromJson(json['status'] as String),
      kycStatus: json['kyc_status'] == null
          ? KycStatus.Pending
          : _kycStatusFromJson(json['kyc_status'] as String),
      kycVerificationLink: json['kyc_verification_url'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'gender': instance.gender,
      'email': instance.email,
      'date_of_birth': instance.dob,
      'id_number': instance.idNumber,
      'country_code': instance.countryCode,
      'phone_number': instance.phoneNumber,
      'profile_picture': instance.profilePicture,
      'wallet': instance.wallet?.toJson(),
      'linked_accounts':
          instance.linkedAccounts?.map((e) => e.toJson()).toList(),
      'role': _$UserRoleEnumMap[instance.role]!,
      'status': _$UserStatusEnumMap[instance.userStatus]!,
      'kyc_status': _$KycStatusEnumMap[instance.kycStatus]!,
      'kyc_verification_url': instance.kycVerificationLink,
      'token': instance.token,
    };

const _$UserRoleEnumMap = {
  UserRole.User: 'User',
  UserRole.Business: 'Business',
};

const _$UserStatusEnumMap = {
  UserStatus.Active: 'Active',
  UserStatus.Inactive: 'Inactive',
  UserStatus.Suspended: 'Suspended',
};

const _$KycStatusEnumMap = {
  KycStatus.Pending: 'Pending',
  KycStatus.InReview: 'InReview',
  KycStatus.Approved: 'Approved',
  KycStatus.Declined: 'Declined',
};
