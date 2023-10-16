import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class MiscAlgos {
  static String deriveUsernameFromEmail(String email) {
    int atIndex = email.indexOf('@');
    String username = email.substring(0, atIndex);

    // Shorten the username if it exceeds 15 characters and if it's an iCloud relay email
    if (username.length > 15 &&
        (email.endsWith("@icloud.com") || email.endsWith("appleid.com"))) {
      if (email.endsWith("@icloud.com")) {
        username = username.substring(0, 15);
      } else {
        username = username.substring(0, -2);
      }
    }

    String modifiedUsername = username.replaceAll('.', '_');
    String modifiedEmail = modifiedUsername;

    return modifiedEmail;
  }

  static String generateRandomString({int length = 32}) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random.secure();
    final codeUnits = List.generate(length, (index) {
      final randomIndex = random.nextInt(chars.length);
      return chars.codeUnitAt(randomIndex);
    });

    return String.fromCharCodes(codeUnits);
  }

  static List<String> rawAndHashedNonce() {
    final rawNonce = generateRandomString();
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();
    return [rawNonce, hashedNonce];
  }

  static List<String> returnSplitName(String fullName) {
    final nameParts = fullName.split(' ');
    String firstName;
    String lastName;
    if (nameParts.length > 2) {
      firstName = nameParts.sublist(0, nameParts.length - 1).join(' ');
      lastName = nameParts.last;
    } else {
      firstName = nameParts[0];
      lastName = nameParts[1];
    }
    return [firstName, lastName];
  }

  static bool isTwoWords(String inputStr) {
    return inputStr.split(" ").length == 2 ? true : false;
  }

  static postgresUIDToInt(String inputUID) {
    // Removing hyphens from the UUID string
    String cleanUuid = inputUID.replaceAll('-', '');

    // Converting the cleaned UUID to a 32-bit unsigned integer
    int result = 0;
    for (int i = 0; i < cleanUuid.length; i++) {
      int hexValue = int.parse(cleanUuid[i], radix: 16);
      result = (result << 4) | hexValue;
    }

    // Making sure the result is non-zero
    if (result == 0) {
      result = 1;
    } else if (result < 0) {
      result = result * -1;
    }

    return result;
  }

  static schedulingExecutor({
    required DateTime inputDate,
    required Function duskCallback,
    required Function morningCallback,
    required Function dayCallback,
    required Function eveningCallback,
    required bool needsHourParam,
  }) {
    final hour = inputDate.hour;
    if (hour >= 21 || hour < 6) {
      // Branch 1: Time is between 9 PM and 5:59 AM
      needsHourParam ? duskCallback(hour) : duskCallback();
    } else if (hour >= 6 && hour < 10) {
      // Branch 2: Time is between 6 AM and 9:59 AM
      needsHourParam ? morningCallback(hour) : morningCallback();
    } else if (hour >= 10 && hour < 17) {
      // Branch 3: Time is between 10 AM and 4:59 PM
      needsHourParam ? dayCallback(hour) : dayCallback();
    } else {
      // Branch 4: Time is between 5 PM and 8:59 PM
      needsHourParam ? eveningCallback(hour) : eveningCallback();
    }
  }
}
