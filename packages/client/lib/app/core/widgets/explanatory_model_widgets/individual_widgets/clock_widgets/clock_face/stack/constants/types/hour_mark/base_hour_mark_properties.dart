import 'package:equatable/equatable.dart';

class BaseHourMarkProperties extends Equatable {
  final double lineOneRotation;
  final double lineOneTranslation;
  final double lineTwoRotation;
  final double lineTwoTranslation;
  final double lineThreeRotation;
  final double lineThreeTranslation;

  const BaseHourMarkProperties({
    required this.lineOneRotation,
    required this.lineOneTranslation,
    required this.lineTwoRotation,
    required this.lineTwoTranslation,
    required this.lineThreeRotation,
    required this.lineThreeTranslation,
  });

  factory BaseHourMarkProperties.zero({
    double lineOneRotation = 0.0,
    double lineOneTranslation = 0.0,
    double lineTwoRotation = 0.0,
    double lineTwoTranslation = 0.0,
    double lineThreeRotation = 0.0,
    double lineThreeTranslation = 0.0,
  }) =>
      BaseHourMarkProperties(
        lineOneRotation: lineOneRotation,
        lineOneTranslation: lineOneTranslation,
        lineTwoRotation: lineTwoRotation,
        lineTwoTranslation: lineTwoTranslation,
        lineThreeRotation: lineThreeRotation,
        lineThreeTranslation: lineThreeTranslation,
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
