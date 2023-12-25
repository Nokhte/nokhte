import 'base_hour_mark_properties.dart';

class NineProperties extends BaseHourMarkProperties {
  const NineProperties({
    required super.lineOneRotation,
    required super.lineOneTranslation,
    required super.lineTwoRotation,
    required super.lineTwoTranslation,
    required super.lineThreeRotation,
    required super.lineThreeTranslation,
    required super.lineOneLength,
    required super.lineTwoLength,
    required super.lineThreeLength,
  });

  factory NineProperties.zero({
    lineOneRotation = 0.0,
    lineOneTranslation = 0.0,
    lineTwoRotation = 0.0,
    lineTwoTranslation = 0.0,
    lineThreeRotation = 0.0,
    lineThreeTranslation = 0.0,
    lineOneLength = 0.0,
    lineTwoLength = 0.0,
    lineThreeLength = 0.0,
  }) =>
      NineProperties(
        lineOneRotation: lineOneRotation,
        lineOneTranslation: lineOneTranslation,
        lineTwoRotation: lineTwoRotation,
        lineTwoTranslation: lineTwoTranslation,
        lineThreeRotation: lineThreeRotation,
        lineThreeTranslation: lineThreeTranslation,
        lineOneLength: lineOneLength,
        lineTwoLength: lineTwoLength,
        lineThreeLength: lineThreeLength,
      );
}
