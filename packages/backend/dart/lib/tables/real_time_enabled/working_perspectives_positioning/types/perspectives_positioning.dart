import 'package:equatable/equatable.dart';

class PerspectivesPositioning extends Equatable {
  final List<String> stagingAreaInfo;
  final String lastEditedBy;
  final int collaboratorsQuadrant;

  PerspectivesPositioning({
    required this.stagingAreaInfo,
    required this.lastEditedBy,
    required this.collaboratorsQuadrant,
  });

  @override
  List<Object> get props => [
        stagingAreaInfo,
        lastEditedBy,
        collaboratorsQuadrant,
      ];
}
