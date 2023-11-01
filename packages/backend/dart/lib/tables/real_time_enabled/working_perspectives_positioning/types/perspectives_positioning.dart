import 'package:equatable/equatable.dart';

class PerspectivesPositioning extends Equatable {
  final List stagingAreaInfo;
  final String lastEditedBy;
  final int collaboratorsQuadrant;
  final String currentUserUID;

  PerspectivesPositioning({
    required this.stagingAreaInfo,
    required this.lastEditedBy,
    required this.collaboratorsQuadrant,
    required this.currentUserUID,
  });

  @override
  List<Object> get props => [
        stagingAreaInfo,
        lastEditedBy,
        collaboratorsQuadrant,
        currentUserUID,
      ];
}
