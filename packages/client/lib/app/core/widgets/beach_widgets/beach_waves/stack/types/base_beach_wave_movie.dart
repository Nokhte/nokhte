import 'package:equatable/equatable.dart';

class BaseBeachWaveMovie extends Equatable {
  final bool shouldPaintSand;

  const BaseBeachWaveMovie({
    this.shouldPaintSand = true,
  });

  @override
  List<Object> get props => [shouldPaintSand];
}
