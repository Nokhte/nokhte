import 'package:equatable/equatable.dart';

class DirectionAngleEntity extends Equatable {
  final Stream<int> angleStream;

  const DirectionAngleEntity({
    required this.angleStream,
  });

  @override
  List<Object> get props => [angleStream];
}
