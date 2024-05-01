// Dart imports:
import 'dart:math';

class ServerTypeTransformer {
  static toDoubleFromServer(dynamic anyType) {
    if (anyType == null) return null;
    if (anyType is! double) return double.parse(anyType.toString());
    return anyType;
  }

  static toDoubleFromServerFixed(dynamic anyType) {
    if (anyType == null) return null;
    if (anyType is! double) {
      return double.parse(anyType.toString()).toPrecision(2);
    }
    return anyType.toPrecision(2);
  }

  static toStringFromServer(dynamic anyType) {
    if (anyType == null) return null;
    if (anyType is! String) return anyType.toString();
    return anyType;
  }

  static toIntFromServer(dynamic anyType) {
    if (anyType == null) return null;
    if (anyType is! int) return int.parse(anyType.toString());
    return anyType;
  }
}

extension Precision on double {
  double toPrecision(int fractionDigits) {
    final mod = pow(10, fractionDigits.toDouble());
    return (this * mod).round().toDouble() / mod;
  }
}
