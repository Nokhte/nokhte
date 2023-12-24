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

  factory ThreeProperties.zero({
    double threeLineOneRotation = 0.0,
    double threeLineOneTranslation = 0.0,
    double threeLineTwoRotation = 0.0,
    double threeLineTwoTranslation = 0.0,
    double threeLineThreeRotation = 0.0,
    double threeLineThreeTranslation = 0.0,
  }) =>
      ThreeProperties(
        threeLineOneRotation: threeLineOneRotation,
        threeLineOneTranslation: threeLineOneTranslation,
        threeLineTwoRotation: threeLineTwoRotation,
        threeLineTwoTranslation: threeLineTwoTranslation,
        threeLineThreeRotation: threeLineThreeRotation,
        threeLineThreeTranslation: threeLineThreeTranslation,
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
