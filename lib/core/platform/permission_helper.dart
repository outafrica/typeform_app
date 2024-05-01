// ignore_for_file: unnecessary_null_comparison

// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:permission_handler/permission_handler.dart';

// Project imports:
import 'utilities/logging.dart';

Future<bool> _requestPermissionFromSettings(
  BuildContext context, {
  required String? requestHint,
  required Permission permission,
  required bool isPreviouslyDeniedOnIOS,
}) async {
  if (kDebugMode) logger.i("${permission.toString()} previously denied");
  final appSettingsPrompt = PlatformAlertDialog(
    title: const Text('Action needed'),
    content: SingleChildScrollView(
      child: Text(
        requestHint ??
            'To access this, please grant permission in the upcoming page',
      ),
    ),
    actions: <Widget>[
      PlatformDialogAction(
        child: const Text('Cancel'),
        onPressed: () {
          Navigator.pop(context, false);
        },
      ),
      PlatformDialogAction(
        child: const Text('OK'),
        onPressed: () {
          Navigator.pop(context, true);
        },
      ),
    ],
  );

  // final bool isPermanentlyDeniedOnAndroid =
  //     Platform.isAndroid && await permission.isPermanentlyDenied;

  logger.i('${await permission.shouldShowRequestRationale}');

  if (Platform.isAndroid && permission == Permission.contacts) {
    final res = await showPlatformDialog(
      context: context,
      builder: (_) => appSettingsPrompt,
    );

    logger.i(res);

    if (res == false) {
      return false;
    } else {
      final PermissionStatus status = await permission.request();
      if (status == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  } else if (Platform.isIOS && permission == Permission.contacts) {
    return true;
  } else {
    final PermissionStatus status = await permission.request();

    logger.i(status);
    if (status == PermissionStatus.granted) {
      return true;
    } else if (status == PermissionStatus.permanentlyDenied) {
      return openAppSettings();

      // logger.i(settingsDidOpen);

      // if (settingsDidOpen) {
      //   final PermissionStatus status = await permission.request();

      //   if (status == PermissionStatus.granted) {
      //     return true;
      //   } else {
      //     return false;
      //   }
      // }
      // return false;
    } else {
      return false;
    }
  }

  // if (!isPreviouslyDeniedOnIOS || !isPermanentlyDeniedOnAndroid) {
  //   if (kDebugMode) {
  //     logger.i(
  //         "${permission.toString()} is permanaently denied. Open app settings");
  //   }

  //   if (permission == Permission.contacts) {
  //     if (permission != null) {
  //       final PermissionStatus status = await permission.request();
  //       if (status == PermissionStatus.granted) {
  //         return true;
  //       }
  //     } else {
  //       return false;
  //     }
  //   }

  //   final settingsDidOpen = await openAppSettings();
  //   if (settingsDidOpen) {
  //     if (permission != null) {
  //       final PermissionStatus status = await permission.request();
  //       if (status == PermissionStatus.granted) {
  //         return true;
  //       }
  //     } else {
  //       return false;
  //     }

  //     return false;
  //   }

  //   return false;
  // }

  // if (await Permission.storage.isRestricted) {
  //   await showPlatformDialog(
  //     context: context,
  //     builder: (_) => PlatformAlertDialog(
  //       title: const Text('Restricted Permissions'),
  //       content: const SingleChildScrollView(
  //         child: Text(
  //           'A system setting is preventing Upesi from getting access to your storage.',
  //         ),
  //       ),
  //       actions: <Widget>[
  //         PlatformDialogAction(
  //           child: const Text('OK'),
  //           onPressed: () {
  //             Navigator.pop(context);
  //           },
  //         ),
  //       ],
  //     ),
  //   );

  //   return false;
  // }

  // return false;
}

Future<bool> requestUsersBiometricsPermission(
  BuildContext context,
) async {
  final res = await showPlatformDialog<bool>(
    context: context,
    builder: (_) => PlatformAlertDialog(
      title: const Text('Biometrics Permission'),
      content: const SingleChildScrollView(
        child: Text(
          'You can use your biometrics to login in place of your login pin',
        ),
      ),
      actions: <Widget>[
        PlatformDialogAction(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        PlatformDialogAction(
          child: const Text('OK'),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ],
    ),
  );

  return res ?? false;
}

// bool _isContactsDeniedOnce = false;
Future<bool> checkUsersContactsPermissionStatus(BuildContext context,
    {String? requestHint}) async {
  final status = await Permission.contacts.status;
  if (status == PermissionStatus.granted) {
    return true;
  } else {
    final _res = await _requestPermissionFromSettings(
      context,
      requestHint: requestHint ??
          "Upesi needs access to your contacts to help you know users already on Upesi from your Contacts. Please enable it in the upcoming screen.",
      isPreviouslyDeniedOnIOS: true,
      permission: Permission.contacts,
    );

    // _isContactsDeniedOnce = true;
    return _res;
  }
}
