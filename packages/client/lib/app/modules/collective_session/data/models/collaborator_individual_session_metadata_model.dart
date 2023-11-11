import 'package:nokhte/app/modules/collective_session/domain/domain.dart';
import 'package:nokhte_backend/collective_sessions.dart';

class CollaboratorIndividualSessionMetadataModel
    extends CollaboratorIndividualSessionMetadataEntity {
  const CollaboratorIndividualSessionMetadataModel(
      {required super.sessionMetadata});

  static CollaboratorIndividualSessionMetadataModel fromSupabase(
      List remoteSourceRes) {
    if (remoteSourceRes.isEmpty) {
      return const CollaboratorIndividualSessionMetadataModel(
          sessionMetadata: {});
    } else {
      final theCollaboratorsNumber =
          remoteSourceRes[0].collaboratorInfo.theCollaboratorsNumber;
      const individualSessionMetadata =
          CollectiveSessionQueries.individualSessionMetadata;
      return CollaboratorIndividualSessionMetadataModel(
        sessionMetadata: remoteSourceRes[1][0]
            ["${theCollaboratorsNumber}_$individualSessionMetadata"],
      );
    }
  }
}
