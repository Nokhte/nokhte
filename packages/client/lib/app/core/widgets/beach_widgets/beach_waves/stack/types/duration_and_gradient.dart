import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';

class DurationAndGradient extends Equatable {
  final List<ColorAndStop> gradient;
  final Duration duration;
  const DurationAndGradient({
    required this.gradient,
    required this.duration,
  });
  factory DurationAndGradient.initial() =>
      const DurationAndGradient(duration: Duration.zero, gradient: []);

  @override
  List<Object> get props => [gradient, duration];
}
