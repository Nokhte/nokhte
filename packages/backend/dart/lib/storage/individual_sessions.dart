import 'package:nokhte_backend/storage/utilities/storage_utilities.dart';
import 'package:nokhte_backend/tables/real_time_enabled/shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'types/types.dart';

class IndividualSessionsStorageQueries extends CollaborativeQueries {
  static get bucketName => "individual_sessions";
  IndividualSessionsStorageQueries({
    required super.supabase,
  });

  uploadPerspective(IndividualSessionAudioClip audioClipData) async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    final storageURL = StorageUtilities.getPersonalPerspectivesURL(
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
}
