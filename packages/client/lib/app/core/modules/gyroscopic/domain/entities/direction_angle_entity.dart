import 'package:equatable/equatable.dart';
import 'package:flutter_compass/flutter_compass.dart';

class DirectionAngleEntity extends Equatable {
  final Stream<CompassEvent> angleStream;

  const DirectionAngleEntity({
    required this.angleStream,
  });

  @override
  List<Object> get props => [angleStream];
}
