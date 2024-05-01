// import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:local_auth/local_auth.dart';

class BiometricUtil {
  ///
  /// hasBiometrics()
  ///
  /// @returns [true] if device has fingerprint/faceID available and registered, [false] otherwise
  Future<bool> hasBiometrics() async {
    final LocalAuthentication localAuth = LocalAuthentication();
    final bool canCheck = await localAuth.canCheckBiometrics;
    if (canCheck) {
      final List<BiometricType> availableBiometrics =
          await localAuth.getAvailableBiometrics();

      if (availableBiometrics.isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  ///
  /// authenticateWithBiometrics()
  ///
  /// @param [message] Message shown to user in FaceID/TouchID popup
  /// @returns [true] if successfully authenticated, [false] otherwise
  Future<bool> authenticateWithBiometrics(
      BuildContext context, String message) async {
    final bool hasBiometricsEnrolled = await hasBiometrics();
    if (hasBiometricsEnrolled) {
      final LocalAuthentication localAuth = LocalAuthentication();
      return localAuth.authenticate(
        localizedReason: message,
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    }
    return false;
  }
}
