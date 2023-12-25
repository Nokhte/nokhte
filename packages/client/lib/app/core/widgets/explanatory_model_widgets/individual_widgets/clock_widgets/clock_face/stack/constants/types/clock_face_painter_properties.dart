import 'package:equatable/equatable.dart';
import 'base_hour_mark_properties.dart';

class ClockFacePainterProperties extends Equatable {
  final double hourMarkLength;
  final BaseHourMarkProperties three;
  final BaseHourMarkProperties six;
  final BaseHourMarkProperties nine;
  final BaseHourMarkProperties twelve;
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
