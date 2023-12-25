import 'package:equatable/equatable.dart';
import 'hour_mark/hour_mark.dart';

class ClockFacePainterProperties extends Equatable {
  final double hourMarkLength;
  final ThreeProperties three;
  final SixProperties six;
  final NineProperties nine;
  final TwelveProperties twelve;
  final List<int> numberOfLinesByHourMark = [
    3, // 3 hour mark
    1,
    1,
    3, // 6 hour mark
    1,
    1,
    3, // 9 hour mark
    1,
    1,
    4, // 12 hour mark
  ];

  ClockFacePainterProperties({
    required this.hourMarkLength,
    required this.three,
    required this.six,
    required this.nine,
    required this.twelve,
  });

  @override
  List<Object> get props => [hourMarkLength, three, six, nine, twelve];
}
