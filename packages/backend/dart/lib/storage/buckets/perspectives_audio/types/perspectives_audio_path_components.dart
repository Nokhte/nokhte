import 'package:equatable/equatable.dart';

class PerspectivesAudioPathComponents extends Equatable {
  final String userUID;
  final String collaboratorsUID;
  final String collaborationID;
  final String individualSessionTimestamp;
  final String collectiveSessionTimestamp;
  final String perspectivesCommitTimestamp;

  PerspectivesAudioPathComponents({
    required this.userUID,
    required this.collaboratorsUID,
    required this.collaborationID,
    required this.individualSessionTimestamp,
    required this.collectiveSessionTimestamp,
    required this.perspectivesCommitTimestamp,
  });

  @override
  List<Object> get props => [
        userUID,
        collaboratorsUID,
        collaborationID,
        individualSessionTimestamp,
        collectiveSessionTimestamp,
        perspectivesCommitTimestamp,
      ];
}
