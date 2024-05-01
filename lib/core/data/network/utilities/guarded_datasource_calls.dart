// Flutter imports:
import 'package:flutter/foundation.dart';

// Project imports:
import 'package:typeform_app/core/data/network/utilities/error_helpers.dart';
import 'package:typeform_app/core/data/network/utilities/failure.dart';
import 'package:typeform_app/core/platform/utilities/logging.dart';

/// Make an API call that internally handles exceptions. Throws a [NetworkFailure].
///
/// This is intended to always be used for ALL remoteDatasurce calls in the repository layer.
/// This means there'll be no need for API-related try-catch blocks in the repository layer.
///
/// The named [*Msg] params may be used to customise the error message depending
/// on the error type. For example, `notFoundMsg` can be set to "User not found",
/// which is descriptive enough to be sent to the Presentation layer for use in
/// a [UIError].
/// Also, you can set `anyMsg` to force all error messages no matter the type to
/// one custom message.
Future<T> guardedApiCall<T>(
  Function run, {
  String? serverErrorMsg,
}) async {
  try {
    final val = await run() as T;
    return val;
  } on ApiFailure catch (e, s) {
    throw getNetworkFailureFromApiFailure(
      e,
      s,
      message: e.message,
    );
  } catch (e, s) {
    if (kDebugMode) {
      logger.e('Internal exception at API: ${e.toString()}');
      logger.i(s.toString());
    }

    // const msg = 'An exception occured while querying the server';
    // reportError('$msg: $e', s);
    throw NetworkFailure(message: e.toString());
  }
}

Future<T> guardedCacheAccess<T>(Function run) async {
  try {
    final val = await run() as T;
    return val;
  } on CacheFailure catch (_) {
    if (kDebugMode) logger.e('Exception at Cache Access: ${_.message}');
    rethrow;
  }
}
