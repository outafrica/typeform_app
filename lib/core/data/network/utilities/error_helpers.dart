// Project imports:
import 'package:typeform_app/core/data/network/network_service_impl.dart';
import 'package:typeform_app/core/data/network/utilities/failure.dart';

/// Return a `UIError` with a human readable [message].
///
/// This is intended to be used in the Usecase `NetwokFailure` and `CacheFailure`
/// handlera, and [message] should be a human readable error messages,
/// so that the bloc layer that makes use of usecases can just propagate these errors
/// to the UI without needing to do any extra processing.
// ignore: prefer_expression_function_bodies
UIError getUIErrorFromUsecaseFailure(
  String message,
  dynamic exception,
  StackTrace stackTrace,
) =>
    UIError(message: message);

NetworkFailure getNetworkFailureFromApiFailure(
  ApiFailure excpetion,
  StackTrace stackTrace, {
  String? message,
}) {
  final String errorMessage = message!;

  return NetworkFailure(message: errorMessage);
}

Future<void> handleApiFailure({
  required String source,
  required String errorMessage,
  required ApiErrors errorCode,
  Map<String, dynamic>? extraData,
}) async {
  // final msgs = (extraData?['errors'] as Map).values.first as List;

  // errorMessage = msgs.first as String;

  throw ApiFailure(errorCode: errorCode, message: errorMessage);
}
