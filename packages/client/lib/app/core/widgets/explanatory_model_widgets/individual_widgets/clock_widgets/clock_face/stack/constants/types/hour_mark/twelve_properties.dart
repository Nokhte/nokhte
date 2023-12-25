import 'package:nokhte/app/core/widgets/explanatory_model_widgets/individual_widgets/clock_widgets/clock_face/stack/constants/types/hour_mark/base_hour_mark_properties.dart';

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

  factory TwelveProperties.zero({
    lineOneRotation = 0.0,
    lineOneTranslation = 0.0,
    lineTwoRotation = 0.0,
    lineTwoTranslation = 0.0,
    lineThreeRotation = 0.0,
    lineThreeTranslation = 0.0,
    lineFourRotation = 0.0,
    lineFourTranslation = 0.0,
    lineFourLength = 0.0,
    lineOneLength = 0.0,
    lineTwoLength = 0.0,
    lineThreeLength = 0.0,
  }) =>
      TwelveProperties(
        lineOneRotation: lineOneRotation,
        lineOneTranslation: lineOneTranslation,
        lineTwoRotation: lineTwoRotation,
        lineTwoTranslation: lineTwoTranslation,
        lineThreeRotation: lineThreeRotation,
        lineThreeTranslation: lineThreeTranslation,
        lineFourRotation: lineFourRotation,
        lineFourTranslation: lineFourTranslation,
        lineFourLength: lineFourLength,
        lineOneLength: lineOneLength,
        lineThreeLength: lineThreeLength,
        lineTwoLength: lineTwoLength,
      );

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
