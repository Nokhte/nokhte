import 'package:equatable/equatable.dart';

class TwelveProperties extends Equatable {
  final double twelveLineOneRotation;
  final double twelveLineOneTranslation;
  final double twelveLineTwoRotation;
  final double twelveLineTwoTranslation;
  final double twelveLineThreeRotation;
  final double twelveLineThreeTranslation;
  final double twelveLineFourRotation;
  final double twelveLineFourTranslation;

  const TwelveProperties({
    required this.twelveLineOneRotation,
    required this.twelveLineOneTranslation,
    required this.twelveLineTwoRotation,
    required this.twelveLineTwoTranslation,
    required this.twelveLineThreeRotation,
    required this.twelveLineThreeTranslation,
    required this.twelveLineFourRotation,
    required this.twelveLineFourTranslation,
  });

  factory TwelveProperties.zero() => const TwelveProperties(
        twelveLineOneRotation: 0,
        twelveLineOneTranslation: 0,
        twelveLineTwoRotation: 0,
        twelveLineTwoTranslation: 0,
        twelveLineThreeRotation: 0,
        twelveLineThreeTranslation: 0,
        twelveLineFourRotation: 0,
        twelveLineFourTranslation: 0,
      );

  @override
  List<Object> get props => [
        twelveLineOneRotation,
        twelveLineOneTranslation,
        twelveLineTwoRotation,
        twelveLineTwoTranslation,
        twelveLineThreeRotation,
        twelveLineThreeTranslation,
        twelveLineFourRotation,
        twelveLineFourTranslation,
      ];
}
