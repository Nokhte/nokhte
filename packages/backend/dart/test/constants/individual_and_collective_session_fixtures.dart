import 'dart:io';
import 'package:nokhte_backend/storage/perspectives_audio.dart';
import '../shared/common_collaborative_test_functions.dart';

class IndividualAndCollectiveSessionFixtures {
  static PerspectiveMetadata getPerspectiveMetadata(
    CommonCollaborativeTestFunctions tSetup,
  ) =>
      PerspectiveMetadata(
        numberOfFiles: 1,
        thePerspective: tSetup.tPerspectives.first,
      );

  static IndividualSessionMetadata getTestMetadata(
    CommonCollaborativeTestFunctions tSetup,
  ) =>
      IndividualSessionMetadata(perspectivesMetadata: [
        getPerspectiveMetadata(tSetup),
      ]);

  static IndividualSessionAudioClip getTestAudioClipData(
    CommonCollaborativeTestFunctions tSetup,
    DateTime now,
  ) =>
      IndividualSessionAudioClip(
        thePerspectivesIndex: 0,
        isOverwritingAnotherFile: true,
        thePerspective: tSetup.tPerspectives.first,
        totalNumberOfFilesForThePerspective: 1,
        theSessionTimestamp: now,
        thePerspectivesTimestamp: now,
        theFile: File('${Directory.current.path}/test/assets/star_wars.wav'),
      );

  static CollectiveSessionAudioExtrapolationInfo getTestExtrapolationInfo(
    CommonCollaborativeTestFunctions tSetup,
    DateTime now,
  ) =>
      CollectiveSessionAudioExtrapolationInfo(
        collectiveSessionTimestamp: now,
        perspectivesCommitTimestamp: now,
        individualSessionMetadata: {
          "metadata": [
            {
              "thePerspective": tSetup.tPerspectives.first,
              "numberOfFiles": 1,
            }
          ]
        },
        individualSessionTimestamp: now,
      );
}
