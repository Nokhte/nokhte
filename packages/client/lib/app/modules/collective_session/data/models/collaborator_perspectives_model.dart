import 'package:nokhte/app/modules/collective_session/domain/domain.dart';
import 'package:nokhte/app/modules/collective_session/types/types.dart';
import 'package:nokhte_backend/storage/buckets/utilities/storage_utilities.dart';

class CollaboratorPerspectivesModel extends CollaboratorPerspectivesEntity {
  const CollaboratorPerspectivesModel(
      {required super.collaboratorPerspectivesData});

  static CollaboratorPerspectivesModel fromSupabase(
      PathsAndSessionMetadata response) {
    List<CollaboratorPerspectivesData> collaboratorPerspectives = List.filled(
        response.individualSessionMetadata.length,
        CollaboratorPerspectivesData(
            thePerspective: '', numberOfFiles: 0, pathsToFiles: const []));
    for (int sessionMetadataIndex = 0;
        sessionMetadataIndex < response.individualSessionMetadata.length;
        sessionMetadataIndex++) {
      for (int pathsIndex = 0;
          pathsIndex < response.fullAndRelativePaths.length;
          pathsIndex++) {
        final formattedPerspective = StorageUtilities.getFormattedPerspective(
            thePerspective:
                response.individualSessionMetadata[sessionMetadataIndex]
                    ["thePerspective"],
            currentIndex: sessionMetadataIndex);

        final thePerspectiveTheFileBelongsTo = response
            .fullAndRelativePaths[pathsIndex].relativePath
            .split('/')[4];

        if (formattedPerspective == thePerspectiveTheFileBelongsTo) {
          collaboratorPerspectives[sessionMetadataIndex].thePerspective =
              response.individualSessionMetadata[sessionMetadataIndex]
                  ['thePerspective'];
          collaboratorPerspectives[sessionMetadataIndex].numberOfFiles++;
          collaboratorPerspectives[sessionMetadataIndex].pathsToFiles.add(
                response.fullAndRelativePaths[pathsIndex].fullPath,
              );
        }
      }
    }
    return CollaboratorPerspectivesModel(
      collaboratorPerspectivesData: collaboratorPerspectives,
    );
  }
}
