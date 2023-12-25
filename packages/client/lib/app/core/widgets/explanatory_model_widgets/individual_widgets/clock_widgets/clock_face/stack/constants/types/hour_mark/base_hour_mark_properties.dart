import 'package:equatable/equatable.dart';

class BaseHourMarkProperties extends Equatable {
  final double lineOneRotation;
  final double lineOneTranslation;
  final double lineOneLength;
  final double lineTwoRotation;
  final double lineTwoTranslation;
  final double lineTwoLength;
  final double lineThreeRotation;
  final double lineThreeTranslation;
  final double lineThreeLength;

  const BaseHourMarkProperties({
    required this.lineOneRotation,
    required this.lineOneTranslation,
    required this.lineOneLength,
    required this.lineTwoRotation,
    required this.lineTwoTranslation,
    required this.lineTwoLength,
    required this.lineThreeRotation,
    required this.lineThreeTranslation,
    required this.lineThreeLength,
  });

  factory BaseHourMarkProperties.zero({
    double lineOneRotation = 0.0,
    double lineOneTranslation = 0.0,
    double lineOneLength = 0.0,
    double lineTwoRotation = 0.0,
    double lineTwoTranslation = 0.0,
    double lineTwoLength = 0.0,
    double lineThreeRotation = 0.0,
    double lineThreeTranslation = 0.0,
    double lineThreeLength = 0.0,
  }) =>
      BaseHourMarkProperties(
        lineOneRotation: lineOneRotation,
        lineOneTranslation: lineOneTranslation,
        lineOneLength: lineOneLength,
        lineTwoRotation: lineTwoRotation,
        lineTwoTranslation: lineTwoTranslation,
        lineTwoLength: lineTwoLength,
        lineThreeRotation: lineThreeRotation,
        lineThreeTranslation: lineThreeTranslation,
        lineThreeLength: lineThreeLength,
      );

  @override
  List<Object> get props => [
        lineOneRotation,
        lineOneTranslation,
        lineOneLength,
        lineTwoRotation,
        lineTwoTranslation,
        lineTwoLength,
        lineThreeRotation,
        lineThreeTranslation,
        lineThreeLength,
      ];
}
