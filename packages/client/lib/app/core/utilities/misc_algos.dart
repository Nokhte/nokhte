import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class MiscAlgos {
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
    String cleanUuid = inputUID.replaceAll('-', '');

    int result = 0;
    for (int i = 0; i < cleanUuid.length; i++) {
      int hexValue = int.parse(cleanUuid[i], radix: 16);
      result = (result << 4) | hexValue;
    }

    if (result == 0) {
      result = 1;
    } else if (result < 0) {
      result = result * -1;
    }

    return result;
  }
}
