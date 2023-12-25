import 'base_hour_mark_properties.dart';

class TwelveProperties extends BaseHourMarkProperties {
  final double lineFourRotation;
  final double lineFourTranslation;
  final double lineFourLength;

  const TwelveProperties({
    required super.lineOneRotation,
    required super.lineOneTranslation,
    required super.lineTwoRotation,
    required super.lineTwoTranslation,
    required super.lineThreeRotation,
    required super.lineThreeTranslation,
    required this.lineFourRotation,
    required this.lineFourTranslation,
    required this.lineFourLength,
    required super.lineOneLength,
    required super.lineTwoLength,
    required super.lineThreeLength,
  });

  @override
  List<Object> get props => [
        lineOneRotation,
        lineOneTranslation,
        lineTwoRotation,
        lineTwoTranslation,
        lineThreeRotation,
        lineThreeTranslation,
        lineFourRotation,
        lineFourTranslation,
      ];
}
