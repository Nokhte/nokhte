import 'package:equatable/equatable.dart';

class PerspectivesPositioning extends Equatable {
  final List stagingAreaInfo;
  final String lastEditedBy;
  final int collaboratorsQuadrant;
  final int usersQuadrant;
  final String currentUserUID;

  PerspectivesPositioning({
    required this.stagingAreaInfo,
    required this.lastEditedBy,
    required this.collaboratorsQuadrant,
    required this.currentUserUID,
    required this.usersQuadrant,
  });

  static Stream<PerspectivesPositioning> get initialStream =>
      Stream.value(PerspectivesPositioning(
        currentUserUID: "",
        collaboratorsQuadrant: -1,
        lastEditedBy: '',
        stagingAreaInfo: const [],
        usersQuadrant: -1,
      ));

  @override
  List<Object> get props => [
        stagingAreaInfo,
        lastEditedBy,
        collaboratorsQuadrant,
        currentUserUID,
      ];
}
