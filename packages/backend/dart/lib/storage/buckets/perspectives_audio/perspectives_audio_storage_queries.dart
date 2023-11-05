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
    // supabase.storage.setAuth(supabase.auth.currentSession?.accessToken ?? '');
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    final storageURL = StorageUtilities.getPersonalPerspectivesPath(
      collaboratorInfo: collaboratorInfo,
      audioClipData: audioClipData,
    );
    // print("hey whats thestor url $storageURL");
    // await supabase.storage.from('').copy(fromPath, toPath);
    await supabase.storage.from(bucketName).upload(
          storageURL,
          audioClipData.theFile,
          fileOptions: FileOptions(
            upsert: audioClipData.isOverwritingAnotherFile,
          ),
        );
  }

  moveToCollectiveSpace(
      CollectiveSessionAudioExtrapolationInfo extrapolationInfo) async {
    // supabase.storage.setAuth(supabase.auth.currentSession?.accessToken ?? '');
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    final List<StartAndEndPaths> paths =
        StorageUtilities.getCollectiveSessionPaths(
            collaboratorInfo: collaboratorInfo,
            extrapolationInfo: extrapolationInfo);
    for (final path in paths) {
      // print(
      //     "start path ${path.startPath} \n \n end path ${path.endPath} \n \n END \n -------------------");
      await supabase.storage.from(bucketName).copy(
            path.startPath,
            path.endPath,
          );
    }
  }
}
