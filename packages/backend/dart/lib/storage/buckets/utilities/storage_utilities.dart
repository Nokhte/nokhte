import 'package:nokhte_backend/storage/buckets/perspectives_audio/types/types.dart';
import 'package:nokhte_backend/tables/real_time_enabled/existing_collaborations/types/types.dart';

class StorageUtilities {
  static String getCollaborationID(CollaboratorInfo collaboratorInfo) =>
      collaboratorInfo.theUsersCollaboratorNumber == "collaborator_one"
          ? "${collaboratorInfo.theUsersUID}_${collaboratorInfo.theCollaboratorsUID}"
          : "${collaboratorInfo.theCollaboratorsUID}_${collaboratorInfo.theUsersUID}";

  static String getPerspectivesCommitTimestamp(
          DateTime thePerspectivesTimestamp) =>
      "perspectives_${thePerspectivesTimestamp.year}-${thePerspectivesTimestamp.month}-${thePerspectivesTimestamp.day}_${thePerspectivesTimestamp.hour}__${thePerspectivesTimestamp.minute}";

  static String getSessionTimestamp(DateTime theSessionTimestamp) =>
      "session_${theSessionTimestamp.year}-${theSessionTimestamp.month}-${theSessionTimestamp.day}_${theSessionTimestamp.hour}__${theSessionTimestamp.minute}";

  static String getFormattedPerspective({
    required int currentIndex,
    required String thePerspective,
  }) =>
      thePerspective
          .replaceAll(' ', '_')
          .substring(0, (thePerspective.length / 2).floor()) +
      currentIndex.toString();

  static String getFileName(
    int theRecordingNumber,
    String theUsersUID,
  ) =>
      '${theUsersUID}_${fileNameMap[theRecordingNumber]!}';

  static getPersonalPerspectivesPath({
    required CollaboratorInfo collaboratorInfo,
    required IndividualSessionAudioClip audioClipData,
    bool excludeFile = false,
  }) {
    final usersUID = collaboratorInfo.theUsersUID;
    final collaborationID = getCollaborationID(collaboratorInfo);
    final perspectivesCommitTimestamp =
        getPerspectivesCommitTimestamp(audioClipData.thePerspectivesTimestamp);
    final sessionTimestamp =
        getSessionTimestamp(audioClipData.theSessionTimestamp);
    final thePerspective = getFormattedPerspective(
      currentIndex: audioClipData.thePerspectivesIndex,
      thePerspective: audioClipData.thePerspective,
    );
    final fileName = getFileName(
      audioClipData.totalNumberOfFilesForThePerspective,
      collaboratorInfo.theUsersUID,
    );
    String path = [
      usersUID,
      collaborationID,
      perspectivesCommitTimestamp,
      sessionTimestamp,
      thePerspective,
      excludeFile ? "" : fileName
    ].join('/');
    return path;
  }

  static List<StartAndEndPaths> getCollectiveSessionPaths({
    required CollectiveSessionAudioExtrapolationInfo extrapolationInfo,
    required CollaboratorInfo collaboratorInfo,
    bool excludeFile = false,
    bool returnCollaboratorsPaths = false,
  }) {
    final userUID = collaboratorInfo.theUsersUID;
    final collaboratorsUID = collaboratorInfo.theCollaboratorsUID;
    final collaborationID = getCollaborationID(collaboratorInfo);
    final individualSessionTimestamp =
        getSessionTimestamp(extrapolationInfo.individualSessionTimestamp);
    final collectiveSessionTimestamp =
        getSessionTimestamp(extrapolationInfo.collectiveSessionTimestamp);
    final perspectivesCommitTimestamp = getPerspectivesCommitTimestamp(
        extrapolationInfo.perspectivesCommitTimestamp);
    final List<StartAndEndPaths> returnPaths = [];
    final List metaArr =
        extrapolationInfo.individualSessionMetadata["metadata"];
    for (int i = 0; i < metaArr.length; i++) {
      final currentFormattedPerspective = getFormattedPerspective(
          currentIndex: i, thePerspective: metaArr[i]["thePerspective"]);
      for (int j = 0; j < metaArr[i]["numberOfFiles"]; j++) {
        final currentFileName = getFileName(
            j + 1, returnCollaboratorsPaths ? collaboratorsUID : userUID);
        final currentStartPath = [
          userUID,
          collaborationID,
          perspectivesCommitTimestamp,
          individualSessionTimestamp,
          currentFormattedPerspective,
          excludeFile ? "" : currentFileName,
        ].join('/');
        final currentEndPath = [
          collaborationID,
          perspectivesCommitTimestamp,
          collectiveSessionTimestamp,
          currentFormattedPerspective,
          returnCollaboratorsPaths ? collaboratorsUID : userUID,
          excludeFile ? "" : currentFileName,
        ].join('/');
        returnPaths.add(
          StartAndEndPaths(
              startPath: currentStartPath, endPath: currentEndPath),
        );
      }
    }
    return returnPaths;
  }

  static Map<int, String> get fileNameMap => {
        1: "one.wav",
        2: "two.wav",
        3: "three.wav",
      };
}
