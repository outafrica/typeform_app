// Project imports:
import 'package:typeform_app/core/data/network/network_service_impl.dart';

class Failure {
  final String message;
  final dynamic data;
  const Failure(
    this.message, {
    this.data,
  });

  @override
  String toString() => message;
}

class ApiFailure extends Failure {
  final ApiErrors errorCode;
  const ApiFailure({
    required this.errorCode,
    required String message,
  }) : super(message);
}

class NetworkFailure {
  final String message;
  const NetworkFailure({
    required this.message,
  });
}

class CacheFailure {
  final String message;
  const CacheFailure({
    required this.message,
  });
}

class UIError {
  final String message;
  const UIError({
    required this.message,
  });
}
