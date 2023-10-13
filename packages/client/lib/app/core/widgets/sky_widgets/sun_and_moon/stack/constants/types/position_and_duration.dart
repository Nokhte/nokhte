import 'package:equatable/equatable.dart';

class PositionAndDuration extends Equatable {
  final double endingPostion;
  final Duration bigMovementStartTime;
  final Duration bigMovementEndTime;
  const PositionAndDuration(
      {required this.bigMovementStartTime,
      required this.bigMovementEndTime,
      required this.endingPostion});

  @override
  List<Object> get props => [
        bigMovementEndTime,
        bigMovementEndTime,
        endingPostion,
      ];
}
