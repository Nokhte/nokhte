import 'dart:math';

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
}
