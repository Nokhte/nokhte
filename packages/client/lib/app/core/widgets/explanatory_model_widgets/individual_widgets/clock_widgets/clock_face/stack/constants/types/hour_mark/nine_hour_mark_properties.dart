import 'package:equatable/equatable.dart';

class NineProperties extends Equatable {
  final double lineOneRotation;
  final double lineOneTranslation;
  final double lineTwoRotation;
  final double lineTwoTranslation;
  final double lineThreeRotation;
  final double lineThreeTranslation;

  const NineProperties({
    required this.lineOneRotation,
    required this.lineOneTranslation,
    required this.lineTwoRotation,
    required this.lineTwoTranslation,
    required this.lineThreeRotation,
    required this.lineThreeTranslation,
  });

  factory NineProperties.zero() => const NineProperties(
        lineOneRotation: 0.0,
        lineOneTranslation: 0.0,
        lineTwoRotation: 0.0,
        lineTwoTranslation: 0.0,
        lineThreeRotation: 0.0,
        lineThreeTranslation: 0.0,
      );

  @override
  List<Object> get props => [
        lineOneRotation,
        lineOneTranslation,
        lineTwoRotation,
        lineTwoTranslation,
        lineThreeRotation,
        lineThreeTranslation,
      ];
}
