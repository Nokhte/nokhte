import 'package:nokhte_backend/storage/types/types.dart';
import 'package:nokhte_backend/tables/real_time_enabled/existing_collaborations/types/types.dart';

class StorageUtilities {
  static getPersonalPerspectivesURL({
    required CollaboratorInfo collaboratorInfo,
    required IndividualSessionAudioClip audioClipData,
  }) {
    final collaborationID = collaboratorInfo.theUsersCollaboratorNumber ==
            "collaborator_one"
        ? "${collaboratorInfo.theUsersUID}_${collaboratorInfo.theCollaboratorsUID}"
        : "${collaboratorInfo.theCollaboratorsUID}_${collaboratorInfo.theUsersUID}";
    final path =
        "${collaboratorInfo.theUsersUID}/$collaborationID/perspectives_${audioClipData.thePerspectivesTimestamp}/session_${audioClipData.theSessionTimestamp}/${collaboratorInfo.theUsersUID + fileNameMap[audioClipData.theRecordingNumber]!}";
    return path;
  }

  static Map<int, String> get fileNameMap => {
        1: "one.wav",
        2: "two.wav",
        3: "three.wav",
      };
}
