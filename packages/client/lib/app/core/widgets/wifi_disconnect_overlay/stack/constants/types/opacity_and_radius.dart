import 'package:equatable/equatable.dart';

class OpacityAndRadius extends Equatable {
  final double opacity;
  final double radius;

  const OpacityAndRadius({
    required this.opacity,
    required this.radius,
  });

  @override
  List<Object> get props => [radius, opacity];
}
