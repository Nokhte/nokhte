import 'package:equatable/equatable.dart';
import 'hour_mark/hour_mark.dart';

class ClockFacePainterProperties extends Equatable {
  final double hourMarkLength;
  final ThreeProperties three;
  final SixProperties six;
  final NineProperties nine;
  final TwelveProperties twelve;

  const ClockFacePainterProperties({
    required this.hourMarkLength,
    required this.three,
    required this.six,
    required this.nine,
    required this.twelve,
  });

  @override
  List<Object> get props => [hourMarkLength, three, six, nine, twelve];
}
