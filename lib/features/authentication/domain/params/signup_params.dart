class SignupParams {
  final String userName;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final int roleId;
  final int genderId;
  final String password;
  final String passwordConfirm;
  final String countryCode;
  final String? deviceId;

  SignupParams({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.roleId,
    required this.genderId,
    required this.password,
    required this.passwordConfirm,
    required this.countryCode,
    this.deviceId,
  });

  SignupParams copyWith({
    String? userName,
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
    int? roleId,
    int? genderId,
    String? password,
    String? passwordConfirm,
    String? countryCode,
    String? deviceId,
  }) =>
      SignupParams(
        userName: userName ?? this.userName,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        roleId: roleId ?? this.roleId,
        genderId: genderId ?? this.genderId,
        password: password ?? this.password,
        passwordConfirm: passwordConfirm ?? this.passwordConfirm,
        countryCode: countryCode ?? this.countryCode,
        deviceId: deviceId ?? this.deviceId,
      );

  @override
  String toString() =>
      'SignupParams(firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, password: $password, passwordConfirm: $passwordConfirm, countryCode: $countryCode, deviceId: $deviceId)';
}
