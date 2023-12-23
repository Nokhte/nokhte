import 'package:equatable/equatable.dart';

class NineProperties extends Equatable {
  final double nineLineOneRotation;
  final double nineLineOneTranslation;
  final double nineLineTwoRotation;
  final double nineLineTwoTranslation;
  final double nineLineThreeRotation;
  final double nineLineThreeTranslation;

  const NineProperties({
    required this.nineLineOneRotation,
    required this.nineLineOneTranslation,
    required this.nineLineTwoRotation,
    required this.nineLineTwoTranslation,
    required this.nineLineThreeRotation,
    required this.nineLineThreeTranslation,
  });

  factory NineProperties.zero() => const NineProperties(
        nineLineOneRotation: 0.0,
        nineLineOneTranslation: 0.0,
        nineLineTwoRotation: 0.0,
        nineLineTwoTranslation: 0.0,
        nineLineThreeRotation: 0.0,
        nineLineThreeTranslation: 0.0,
      );

  @override
  List<Object> get props => [
        nineLineOneRotation,
        nineLineOneTranslation,
        nineLineTwoRotation,
        nineLineTwoTranslation,
        nineLineThreeRotation,
        nineLineThreeTranslation,
      ];
}
