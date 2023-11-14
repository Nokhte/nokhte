import 'package:nokhte_backend/storage/buckets/perspectives_audio/types/types.dart';
import 'package:nokhte_backend/tables/real_time_enabled/existing_collaborations/types/types.dart';
import 'package:nokhte_core/custom_control_structures.dart';

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

  static PerspectivesAudioPathComponents extractPathComponents(
    CollectiveSessionAudioExtrapolationInfo extrapolationInfo,
    CollaboratorInfo collaboratorInfo,
  ) {
    //
    final userUID = collaboratorInfo.theUsersUID;
    final collaboratorsUID = collaboratorInfo.theCollaboratorsUID;
    final collaborationID = getCollaborationID(collaboratorInfo);
    final individualSessionTimestamp =
        getSessionTimestamp(extrapolationInfo.individualSessionTimestamp);
    final collectiveSessionTimestamp =
        getSessionTimestamp(extrapolationInfo.collectiveSessionTimestamp);
    final perspectivesCommitTimestamp = getPerspectivesCommitTimestamp(
        extrapolationInfo.perspectivesCommitTimestamp);
    return PerspectivesAudioPathComponents(
      userUID: userUID,
      collaboratorsUID: collaboratorsUID,
      collaborationID: collaborationID,
      individualSessionTimestamp: individualSessionTimestamp,
      collectiveSessionTimestamp: collectiveSessionTimestamp,
      perspectivesCommitTimestamp: perspectivesCommitTimestamp,
    );
  }

  static List<StartAndEndPaths> getCollectiveSessionPaths({
    required CollectiveSessionAudioExtrapolationInfo extrapolationInfo,
    required CollaboratorInfo collaboratorInfo,
    bool excludeFile = false,
    bool returnCollaboratorsPaths = false,
  }) {
    final pathComponents =
        extractPathComponents(extrapolationInfo, collaboratorInfo);
    final List metaArr =
        extrapolationInfo.individualSessionMetadata["metadata"];
    return getStartAndEndPaths(
      metaArr,
      pathComponents,
      excludeFile: excludeFile,
      returnCollaboratorsPaths: returnCollaboratorsPaths,
    );
  }

  static List getBaseUserAudioPath(PerspectivesAudioPathComponents pathComps) =>
      [
        pathComps.userUID,
        pathComps.collaborationID,
        pathComps.perspectivesCommitTimestamp,
        pathComps.individualSessionTimestamp,
      ];
  static List getBaseCollaborationAudioPath(
          PerspectivesAudioPathComponents pathComps) =>
      [
        pathComps.collaborationID,
        pathComps.perspectivesCommitTimestamp,
        pathComps.collectiveSessionTimestamp,
      ];

  static List<StartAndEndPaths> getStartAndEndPaths(
    List metaArr,
    PerspectivesAudioPathComponents pathComps, {
    required bool excludeFile,
    required bool returnCollaboratorsPaths,
  }) {
    final List<StartAndEndPaths> returnPaths = [];
    NestedLoops.nestedList(
      theList: metaArr,
      optionalNestedListObjectKey: "numberOfFiles",
      callback: (outterIndex, innerIndex) {
        final currentFormattedPerspective = getFormattedPerspective(
            currentIndex: outterIndex,
            thePerspective: metaArr[outterIndex]["thePerspective"]);
        final currentFileName = getFileName(
            innerIndex + 1,
            returnCollaboratorsPaths
                ? pathComps.collaboratorsUID
                : pathComps.userUID);
        final currentStartPathList = getBaseUserAudioPath(pathComps)
          ..add(currentFormattedPerspective)
          ..add(excludeFile ? "" : currentFileName)
          ..join('/');
        final currentStartPath = currentStartPathList.join('/');
        final currentEndPathList = getBaseCollaborationAudioPath(pathComps)
          ..add(currentFormattedPerspective)
          ..add(returnCollaboratorsPaths
              ? pathComps.collaboratorsUID
              : pathComps.userUID)
          ..add(excludeFile ? "" : currentFileName);
        final currentEndPath = currentEndPathList.join('/');
        returnPaths.add(
          StartAndEndPaths(
              startPath: currentStartPath, endPath: currentEndPath),
        );
      },
    );
    return returnPaths;
  }

  static Map<int, String> get fileNameMap => {
        1: "one.wav",
        2: "two.wav",
        3: "three.wav",
      };
}
