import 'package:equatable/equatable.dart';

class Position extends Equatable {
  final double endingPostion;
  const Position({required this.endingPostion});

  @override
  List<Object> get props => [
        endingPostion,
      ];
}
