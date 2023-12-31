import 'package:nokhte/app/modules/collective_session/domain/domain.dart';
import 'package:nokhte/app/modules/collective_session/types/types.dart';
import 'package:nokhte_core/custom_control_structures.dart';
import 'package:nokhte_backend/storage/buckets/utilities/storage_utilities.dart';

class CollaboratorPerspectivesModel extends CollaboratorPerspectivesEntity {
  const CollaboratorPerspectivesModel(
      {required super.collaboratorPerspectivesData});

  static CollaboratorPerspectivesModel fromSupabase(
      PathsAndSessionMetadata response) {
    final metadata = response.individualSessionMetadata;
    final paths = response.fullAndRelativePaths;

    List<CollaboratorPerspectivesData> collaboratorPerspectives = List.generate(
      response.individualSessionMetadata.length,
      (index) => CollaboratorPerspectivesData(
        numberOfFilesTheyHaveListenedTo: 0,
        thePerspective: metadata[index]["thePerspective"],
        numberOfFiles: 0,
        pathsToFiles: List.empty(growable: true),
      ),
    );

    NestedLoops.twoDifferentLists(paths, metadata, (pathsIndex, metadataIndex) {
      final pathAsArr = paths[pathsIndex].fullPath.split('/');
      final persPath = pathAsArr[pathAsArr.length - 3];

      final metaDataCompVal = StorageUtilities.getFormattedPerspective(
          thePerspective: metadata[metadataIndex]["thePerspective"],
          currentIndex: metadataIndex);
      if (persPath == metaDataCompVal) {
        collaboratorPerspectives[metadataIndex].numberOfFiles++;
        collaboratorPerspectives[metadataIndex]
            .pathsToFiles
            .add(response.fullAndRelativePaths[pathsIndex].fullPath);
      }
    });
    return CollaboratorPerspectivesModel(
      collaboratorPerspectivesData: collaboratorPerspectives,
    );
  }
}
