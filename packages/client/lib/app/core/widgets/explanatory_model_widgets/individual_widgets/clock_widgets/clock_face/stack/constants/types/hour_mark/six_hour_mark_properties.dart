import 'package:equatable/equatable.dart';

class SixProperties extends Equatable {
  final double sixLineOneRotation;
  final double sixLineOneTranslation;
  final double sixLineTwoRotation;
  final double sixLineTwoTranslation;
  final double sixLineThreeRotation;
  final double sixLineThreeTranslation;

  const SixProperties({
    required this.sixLineOneRotation,
    required this.sixLineOneTranslation,
    required this.sixLineTwoRotation,
    required this.sixLineTwoTranslation,
    required this.sixLineThreeRotation,
    required this.sixLineThreeTranslation,
  });

  factory SixProperties.zero() => const SixProperties(
        sixLineOneRotation: 0,
        sixLineOneTranslation: 0,
        sixLineTwoRotation: 0,
        sixLineTwoTranslation: 0,
        sixLineThreeRotation: 0,
        sixLineThreeTranslation: 0,
      );

  @override
  List<Object> get props => [
        sixLineOneRotation,
        sixLineOneTranslation,
        sixLineTwoRotation,
        sixLineTwoTranslation,
        sixLineThreeRotation,
        sixLineThreeTranslation,
      ];
}
