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
}
