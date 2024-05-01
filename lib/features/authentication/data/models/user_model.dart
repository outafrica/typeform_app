import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:typeform_app/features/authentication/data/models/authentication_models.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String username,
    @JsonKey(
      name: 'first_name',
      required: false,
    )
    required String firstName,
    @JsonKey(
      name: 'last_name',
      required: false,
    )
    required String lastName,
    required String gender,
    required String email,
    @JsonKey(
      name: 'date_of_birth',
      required: false,
    )
    String? dob,
    @JsonKey(
      name: 'id_number',
      required: false,
    )
    String? idNumber,
    @JsonKey(
      name: 'country_code',
      required: false,
    )
    String? countryCode,
    @JsonKey(
      name: 'phone_number',
      required: false,
    )
    required String phoneNumber,
    @JsonKey(
      name: 'profile_picture',
      required: false,
    )
    String? profilePicture,
    WalletModel? wallet,
    @JsonKey(
      name: 'linked_accounts',
      required: false,
      fromJson: _accountsFromJson,
    )
    List<LinkedAccountModel>? linkedAccounts,
    @JsonKey(
      name: 'role',
      required: false,
      defaultValue: UserRole.User,
      fromJson: _roleFromJson,
    )
    required UserRole role,
    @JsonKey(
      name: 'status',
      required: false,
      defaultValue: UserStatus.Active,
      fromJson: _userStatusFromJson,
    )
    required UserStatus userStatus,
    @JsonKey(
      name: 'kyc_status',
      required: false,
      defaultValue: KycStatus.Pending,
      fromJson: _kycStatusFromJson,
    )
    required KycStatus kycStatus,
    @JsonKey(
      name: 'kyc_verification_url',
      required: false,
    )
    required String kycVerificationLink,
    required String token,
  }) = _UserModel;

  factory UserModel.fromJson(Map json) => _$UserModelFromJson(
      Map.castFrom<dynamic, dynamic, String, dynamic>(json));
}

List<LinkedAccountModel> _accountsFromJson(List accounts) => accounts
    .where((e) => e != null)
    .map((e) => LinkedAccountModel.fromJson(
          Map.castFrom<dynamic, dynamic, String, dynamic>(e as Map),
        ))
    .toList();

UserStatus _userStatusFromJson(String json) => json == 'Active'
    ? UserStatus.Active
    : json == 'Inactive'
        ? UserStatus.Inactive
        : UserStatus.Suspended;

enum UserStatus {
  Active,
  Inactive,
  Suspended,
}

KycStatus _kycStatusFromJson(String json) => json == 'Pending'
    ? KycStatus.Pending
    : json == 'InReview'
        ? KycStatus.InReview
        : json == 'Approved'
            ? KycStatus.Approved
            : KycStatus.Declined;

enum KycStatus {
  Pending,
  InReview,
  Approved,
  Declined,
}

UserRole _roleFromJson(String json) =>
    json == 'User' ? UserRole.User : UserRole.Business;

enum UserRole {
  User,
  Business,
}
