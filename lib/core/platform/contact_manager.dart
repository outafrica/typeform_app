// Package imports:
import 'package:contacts_service/contacts_service.dart';

// Project imports:
import 'package:typeform_app/core/platform/utilities/utilities.dart';

class DeviceContactModel {
  String phone;
  String? displayName;
  String? email;

  DeviceContactModel({
    required this.phone,
    this.displayName,
    this.email,
  });

  DeviceContactModel.fromJson(Map json)
      : displayName = json['displayName'] as String,
        email = json['email'] as String,
        phone = json['phone'] as String;

  Map toJson() => {
        'displayName': displayName,
        'email': email,
        'phone': phone,
      };

  @override
  String toString() =>
      'DeviceContactModel(phone: $phone, displayName: $displayName, email: $email)';
}

class ContactsManager {
  static Future<List<DeviceContactModel>> getDeviceContacts() async {
    final contacts = <DeviceContactModel>[];

    try {
      final List<Contact> deviceContacts = await ContactsService.getContacts(
        withThumbnails: false,
        photoHighResolution: false,
      );

      for (final contact in deviceContacts) {
        // logger.i(contact.toMap());
        for (final item in contact.phones!.toList()) {
          final formattedNumber = await ContactsUtil.formatContact(item.value);

          if (formattedNumber == null || formattedNumber.contains("null")) {
            logger.e(
              "ContactManager - getContact: ${item.value} $formattedNumber",
            );
          }

          if (formattedNumber != null && !formattedNumber.contains("null")) {
            final contactBook = DeviceContactModel(
              phone: formattedNumber,
              displayName: contact.displayName ?? formattedNumber,
              // email: contact.emails != null
              //     ? contact.emails!.toList()[0].value
              //     : '',
            );
            contacts.add(contactBook);
          }
        }
      }
      return contacts..sort((a, b) => a.displayName!.compareTo(b.displayName!));
    } catch (e, s) {
      logger.e(e);
      logger.e(s);
      return contacts;
    }
  }
}
