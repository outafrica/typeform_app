import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

Future<String?> getDeviceInfo() async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  try {
    if (Platform.isAndroid) {
      final build = await deviceInfoPlugin.androidInfo;
      return build.id;
    } else if (Platform.isIOS) {
      final build = await deviceInfoPlugin.iosInfo;
      return build.identifierForVendor;
    }
  } on PlatformException {
    return 'Failed to get DeviceInfo';
  }
  return null;
}
