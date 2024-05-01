class PinParams {
  final String userName;
  final String pin;
  final String? deviceId;

  PinParams({
    required this.userName,
    required this.pin,
    this.deviceId,
  });

  PinParams copyWith({
    String? userName,
    String? pin,
    String? deviceId,
    String? loginIp,
  }) =>
      PinParams(
        userName: userName ?? this.userName,
        pin: pin ?? this.pin,
        deviceId: deviceId ?? this.deviceId,
      );

  @override
  String toString() =>
      'PinParams(userName: $userName, pin: $pin, deviceId: $deviceId)';
}
