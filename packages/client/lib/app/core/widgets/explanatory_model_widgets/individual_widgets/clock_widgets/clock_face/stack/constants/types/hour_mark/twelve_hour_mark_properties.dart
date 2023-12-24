import 'package:equatable/equatable.dart';

class TwelveProperties extends Equatable {
  final double lineOneRotation;
  final double lineOneTranslation;
  final double lineTwoRotation;
  final double lineTwoTranslation;
  final double lineThreeRotation;
  final double lineThreeTranslation;
  final double lineFourRotation;
  final double lineFourTranslation;

  const TwelveProperties({
    required this.lineOneRotation,
    required this.lineOneTranslation,
    required this.lineTwoRotation,
    required this.lineTwoTranslation,
    required this.lineThreeRotation,
    required this.lineThreeTranslation,
    required this.lineFourRotation,
    required this.lineFourTranslation,
  });

  factory TwelveProperties.zero() => const TwelveProperties(
        lineOneRotation: 0,
        lineOneTranslation: 0,
        lineTwoRotation: 0,
        lineTwoTranslation: 0,
        lineThreeRotation: 0,
        lineThreeTranslation: 0,
        lineFourRotation: 0,
        lineFourTranslation: 0,
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
