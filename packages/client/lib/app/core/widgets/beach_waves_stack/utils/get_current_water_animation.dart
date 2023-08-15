import 'package:simple_animations/simple_animations.dart';

class GetCurrentWaterAnimation {
  static List<dynamic> values(Movie value) {
    final currentWaterValue = value.get('water movement');
    return [
      currentWaterValue,
    ];
  }
}
