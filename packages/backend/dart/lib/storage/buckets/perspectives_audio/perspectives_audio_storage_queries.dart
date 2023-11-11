import 'package:nokhte_backend/storage/buckets/utilities/storage_utilities.dart';
import 'package:nokhte_backend/tables/real_time_enabled/shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'types/types.dart';

class PerspectivesAudioStorageQueries extends CollaborativeQueries {
  static get bucketName => "perspectives_audio";
  PerspectivesAudioStorageQueries({
    required super.supabase,
  });

  uploadPerspective(IndividualSessionAudioClip audioClipData) async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    final storageURL = StorageUtilities.getPersonalPerspectivesPath(
      collaboratorInfo: collaboratorInfo,
      audioClipData: audioClipData,
    );
    await supabase.storage.from(bucketName).upload(
          storageURL,
          audioClipData.theFile,
          fileOptions: FileOptions(
            upsert: audioClipData.isOverwritingAnotherFile,
          ),
        );
  }

  moveToCollectiveSpace(
    CollectiveSessionAudioExtrapolationInfo extrapolationInfo,
  ) async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    final List<StartAndEndPaths> paths =
        StorageUtilities.getCollectiveSessionPaths(
            collaboratorInfo: collaboratorInfo,
            extrapolationInfo: extrapolationInfo);
    for (final path in paths) {
      await supabase.storage.from(bucketName).copy(
            path.startPath,
            path.endPath,
          );
    }
  }

  Future<List<PathAndBytes>> downloadTheCollaboratorsAudioClips(
    CollectiveSessionAudioExtrapolationInfo extrapolationInfo,
  ) async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    final List<PathAndBytes> theList = [];
    final List<StartAndEndPaths> paths =
        StorageUtilities.getCollectiveSessionPaths(
      collaboratorInfo: collaboratorInfo,
      extrapolationInfo: extrapolationInfo,
      returnCollaboratorsPaths: true,
    );
    for (final path in paths) {
      final List pathAsList = path.endPath.split('/');
      pathAsList.removeAt(4);
      final String pathAsString = pathAsList.join('/');
      final rawBytes =
          await supabase.storage.from(bucketName).download(path.endPath);
      final pathAndFile = PathAndBytes(path: pathAsString, rawBytes: rawBytes);
      theList.add(pathAndFile);
    }
    return theList;
  }

  emptyTheBucket(
      CollectiveSessionAudioExtrapolationInfo extrapolationInfo) async {
    final List<StartAndEndPaths> paths =
        StorageUtilities.getCollectiveSessionPaths(
            collaboratorInfo: collaboratorInfo,
            extrapolationInfo: extrapolationInfo);
    for (final path in paths) {
      await supabase.storage.from(bucketName).remove([path.startPath]);
      await supabase.storage.from(bucketName).remove([path.endPath]);
    }
  }
}
