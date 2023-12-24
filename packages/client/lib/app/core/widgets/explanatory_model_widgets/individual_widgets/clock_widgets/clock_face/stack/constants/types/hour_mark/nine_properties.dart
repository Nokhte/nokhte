import 'base_hour_mark_properties.dart';

class NineProperties extends BaseHourMarkProperties {
  const NineProperties({
    required super.lineOneRotation,
    required super.lineOneTranslation,
    required super.lineTwoRotation,
    required super.lineTwoTranslation,
    required super.lineThreeRotation,
    required super.lineThreeTranslation,
  });

  factory NineProperties.zero({
    double lineOneRotation = 0.0,
    double lineOneTranslation = 0.0,
    double lineTwoRotation = 0.0,
    double lineTwoTranslation = 0.0,
    double lineThreeRotation = 0.0,
    double lineThreeTranslation = 0.0,
  }) =>
      NineProperties(
        lineOneRotation: lineOneRotation,
        lineOneTranslation: lineOneTranslation,
        lineTwoRotation: lineTwoRotation,
        lineTwoTranslation: lineTwoTranslation,
        lineThreeRotation: lineThreeRotation,
        lineThreeTranslation: lineThreeTranslation,
      );
}
