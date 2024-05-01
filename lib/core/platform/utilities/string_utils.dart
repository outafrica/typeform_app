// Package imports:
import 'package:intl/intl.dart';

class StringUtils {
  /// Remove all non number characters from [source]
  static String stripNonNumericChars(String source) =>
      source.replaceAll(RegExp(r"[^\d]"), '');

  /// Remove all non number characters from [source], while maintaining decimal points,
  /// for the sake of price processing
  static String stripNonNumericCharsForPrice(String source) =>
      source.replaceAll(RegExp(r"[^\d.]"), '');

  /// Format currency
  static String formatCurrency(String amount) {
    final numberFormat = NumberFormat("#,##0", "en_US");

    final res = numberFormat.format(double.parse(amount));

    return res;
  }
}

extension EmailValidator on String {
  bool isValidEmail() => RegExp(
          r'^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()\.,;\s@\"]+\.{0,1})+([^<>()\.,;:\s@\"]{2,}|[\d\.]+))$')
      .hasMatch(this);
}

extension StringExtension on String {
  String capitalize() => "${this[0].toUpperCase()}${substring(1)}";
  String get capitalizeFirstofEach => replaceAll(RegExp(' +'), ' ')
      .toLowerCase()
      .split(" ")
      .map((str) => str.capitalize())
      .join(" ");
}
