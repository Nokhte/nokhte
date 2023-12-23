import 'package:equatable/equatable.dart';

class ThreeProperties extends Equatable {
  final double threeLineOneRotation;
  final double threeLineOneTranslation;
  final double threeLineTwoRotation;
  final double threeLineTwoTranslation;
  final double threeLineThreeRotation;
  final double threeLineThreeTranslation;

  const ThreeProperties({
    required this.threeLineOneRotation,
    required this.threeLineOneTranslation,
    required this.threeLineTwoRotation,
    required this.threeLineTwoTranslation,
    required this.threeLineThreeRotation,
    required this.threeLineThreeTranslation,
  });

  factory ThreeProperties.zero() => const ThreeProperties(
        threeLineOneRotation: 0,
        threeLineOneTranslation: 0,
        threeLineTwoRotation: 0,
        threeLineTwoTranslation: 0,
        threeLineThreeRotation: 0,
        threeLineThreeTranslation: 0,
      );

  @override
  List<Object> get props => [
        threeLineOneRotation,
        threeLineOneTranslation,
        threeLineTwoRotation,
        threeLineTwoTranslation,
        threeLineThreeRotation,
        threeLineThreeTranslation,
      ];
}
