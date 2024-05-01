// ignore_for_file: unnecessary_null_comparison

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter_sim_country_code/flutter_sim_country_code.dart';

// Project imports:
import 'string_utils.dart';

class ContactsUtil {
  static Future<String?> formatContact(String? contact) async {
    if (contact == null) {
      return null;
    }
    try {
      if (contact.startsWith('+')) {
        return "+${removeLeadingZeroes(_stripInvalidChars(contact))}";
      }

      final localNumber = removeLeadingZeroes(_stripInvalidChars(contact));
      if (localNumber == null) return null;

      final countryCode = await _getCountryCodeFromSim();

      if (countryCode != null && countryCode.isNotEmpty) {
        return "+${countryCode.replaceAll("+", "")}$localNumber";
      }

      return kDebugMode ? "+254$localNumber" : null;
    } catch (_) {
      return null;
    }
  }

  static Future<String?> _getCountryCodeFromSim() async {
    try {
      final code = await FlutterSimCountryCode.simCountryCode;
      final _selectedCountry = CountryPickerUtils.getCountryByIsoCode(code!);

      return _selectedCountry.phoneCode;
    } catch (e) {
      return null;
    }
  }

  static String _stripInvalidChars(String source) =>
      StringUtils.stripNonNumericChars(source);

  static String removeLeadingZeroes(String src) => src.startsWith("0")
      ? removeLeadingZeroes(src.substring(1, src.length))
      : src;

//  static String stripCountryCode(String phoneNumber)
}
