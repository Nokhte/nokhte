import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

class GenerateSomeRandom {
  static String string({int length = 32}) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random.secure();
    final codeUnits = List.generate(length, (index) {
      final randomIndex = random.nextInt(chars.length);
      return chars.codeUnitAt(randomIndex);
    });

    return String.fromCharCodes(codeUnits);
  }

  static List<String> rawAndHashedNonce() {
    final rawNonce = GenerateSomeRandom.string();
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();
    return [rawNonce, hashedNonce];
  }
}
