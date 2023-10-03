import 'package:flutter_compass/flutter_compass.dart';

class ConstantCompassEvent {
  static Stream<CompassEvent> get successCase =>
      Stream.value(CompassEvent.fromList([95.95, 0, 0]));
  static Stream<CompassEvent> get notSuccessCase =>
      Stream.value(CompassEvent.fromList([-1, 0, 0]));
}
