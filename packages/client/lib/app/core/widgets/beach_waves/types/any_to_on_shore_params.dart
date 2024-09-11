import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class AnyToOnShoreParams extends Equatable {
  final List<ColorAndStop> startingColors;
  final List<ColorAndStop> endingColors;
  final double endValue;

  const AnyToOnShoreParams({
    required this.startingColors,
    this.endingColors = WaterColorsAndStops.onShoreWater,
    this.endValue = -10.0,
  });
  @override
  List<Object> get props => [];
}
