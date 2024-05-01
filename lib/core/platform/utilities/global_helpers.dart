// Dart imports:
import 'dart:math';

class ImageHelper {
  static bool hasWrongPath(String url) =>
      !url.startsWith('assets') && !url.startsWith("http") ? true : false;

  static bool isImageAnAssetImage(String url) =>
      url.startsWith('assets') ? true : false;

  static bool isImageSvg(String url) => url.contains('.svg') ? true : false;

  static bool isImageOnlineSvg(String url) =>
      url.contains('.svg') && url.contains("http") ? true : false;

  static bool isImagePngOrHpg(String url) =>
      url.contains('.png') || url.contains('.jpg') || url.contains('.jpeg')
          ? true
          : false;
}

class RandomDigits {
  static const MaxNumericDigits = 17;
  static final _random = Random();

  static int getInteger(int digitCount) {
    if (digitCount > MaxNumericDigits || digitCount < 1) {
      throw RangeError.range(0, 1, MaxNumericDigits, "Digit Count");
    }
    var digit = _random.nextInt(9) + 1; // first digit must not be a zero
    int n = digit;

    for (var i = 0; i < digitCount - 1; i++) {
      digit = _random.nextInt(10);
      n *= 10;
      n += digit;
    }
    return n;
  }

  static String getString(int digitCount) {
    String s = "";
    for (var i = 0; i < digitCount; i++) {
      s += _random.nextInt(10).toString();
    }
    return s;
  }
}
