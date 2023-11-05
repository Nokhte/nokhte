import 'package:nokhte_backend/storage/buckets/perspectives_audio/types/types.dart';
import 'package:nokhte_backend/tables/real_time_enabled/existing_collaborations/types/types.dart';

class StorageUtilities {
  static String getCollaborationID(CollaboratorInfo collaboratorInfo) =>
      collaboratorInfo.theUsersCollaboratorNumber == "collaborator_one"
          ? "${collaboratorInfo.theUsersUID}_${collaboratorInfo.theCollaboratorsUID}"
          : "${collaboratorInfo.theCollaboratorsUID}_${collaboratorInfo.theUsersUID}";

  static String getPerspectivesCommitTimestamp(
          DateTime thePerspectivesTimestamp) =>
      "perspectives_${thePerspectivesTimestamp.year}-${thePerspectivesTimestamp.month}-${thePerspectivesTimestamp.day}_${thePerspectivesTimestamp.hour}:${thePerspectivesTimestamp.minute}";

  static String getSessionTimestamp(DateTime theSessionTimestamp) =>
      "session_${theSessionTimestamp.year}-${theSessionTimestamp.month}-${theSessionTimestamp.day}_${theSessionTimestamp.hour}:${theSessionTimestamp.minute}";

  static String getFormattedPerspective({
    required int currentIndex,
    required String thePerspective,
  }) =>
      thePerspective
          .replaceAll(' ', '_')
          .substring(0, (thePerspective.length / 2).floor()) +
      currentIndex.toString();
  // the things we need are the index

  static String getFileName(
    int theRecordingNumber,
    CollaboratorInfo collaboratorInfo,
  ) =>
      '${collaboratorInfo.theUsersUID}_${fileNameMap[theRecordingNumber]!}';

  static getPersonalPerspectivesPath({
    required CollaboratorInfo collaboratorInfo,
    required IndividualSessionAudioClip audioClipData,
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
      audioClipData.theRecordingNumber,
      collaboratorInfo,
    );
    final path = [
      usersUID,
      collaborationID,
      perspectivesCommitTimestamp,
      sessionTimestamp,
      thePerspective,
      fileName
    ].join('/');
    // print("THE path $path");
    return path;
  }

  static List<StartAndEndPaths> getCollectiveSessionPaths({
    required CollectiveSessionAudioExtrapolationInfo extrapolationInfo,
    required CollaboratorInfo collaboratorInfo,
  }) {
    final userUID = collaboratorInfo.theUsersUID;
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
        final currentFileName = getFileName(j + 1, collaboratorInfo);
        final currentStartPath = [
          userUID,
          collaborationID,
          perspectivesCommitTimestamp,
          individualSessionTimestamp,
          currentFormattedPerspective,
          currentFileName,
        ].join('/');
        final currentEndPath = [
          collaborationID,
          perspectivesCommitTimestamp,
          collectiveSessionTimestamp,
          currentFormattedPerspective,
          userUID,
          currentFileName
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
