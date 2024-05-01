// Dart imports:
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

// Project imports:
import 'utilities/logging.dart';

class FileDownloadUtil {
  static Future<void> downloadUrl({
    required List<String> urls,
    required BuildContext context,
  }) async {
    final Dio dio = Dio();

    final path = await getDownloadPath();

    for (final url in urls) {
      logger.i(url);

      final extension = url.substring(url.lastIndexOf("."));

      final filePath = "$path/file$extension";

      // ignore: unawaited_futures
      EasyLoading.showInfo('Started Downloading');

      await dio.download(
        url,
        filePath,
        deleteOnError: true,
        onReceiveProgress: (int rec, int total) async {
          final _progressString =
              ((rec / total) * 100).toStringAsFixed(0) + "%";

          logger.i(_progressString);

          if (_progressString == "100%") {
            // ignore: unawaited_futures
            EasyLoading.showInfo('Finished Downloading');

            logger.i(filePath);

            await OpenFilex.open(filePath);
          }
        },
      );
    }
  }

  static createPDFBase64({
    required String base64,
    required String fileName,
  }) async {
    try {
      await EasyLoading.show(status: 'Saving Receipt');

      final bytes = base64Decode(base64);

      final path = await getDownloadPath();

      final file = File("${path}/$fileName.pdf");

      await file.writeAsBytes(bytes.buffer.asUint8List());

      await EasyLoading.dismiss();

      await OpenFilex.open(file.path);
    } catch (err, s) {
      logger.e("$err");

      logger.e(s);

      await EasyLoading.showError('Failed to save receipt');
    }
  }

  static Future<String?> getDownloadPath() async {
    Directory? directory;

    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = await getExternalStorageDirectory();
      }
    } catch (err, s) {
      logger.e("$err\nCannot get download folder path");

      logger.e(s);
    }
    return directory?.path;
  }
}
