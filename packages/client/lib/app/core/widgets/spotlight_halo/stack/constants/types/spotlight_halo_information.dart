import 'package:equatable/equatable.dart';

class SpotlightHaloInformation extends Equatable {
  final double radius;
  final double arcStart;
  final double arcEnd;
  final double opacity;

  const SpotlightHaloInformation(
      {required this.radius,
      required this.arcEnd,
      required this.arcStart,
      required this.opacity});

  @override
  List<Object> get props => [radius, arcStart, arcEnd, opacity];
}
