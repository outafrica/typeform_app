class LoginParams {
  final String username;
  final String password;
  final String? deviceId;

  LoginParams({
    required this.username,
    required this.password,
    this.deviceId,
  });

  LoginParams copyWith({
    String? username,
    String? password,
    String? deviceId,
    String? loginIp,
  }) =>
      LoginParams(
        username: username ?? this.username,
        password: password ?? this.password,
        deviceId: deviceId ?? this.deviceId,
      );

  @override
  String toString() =>
      'LoginParams(username: $username, password: $password, deviceId: $deviceId)';
}
