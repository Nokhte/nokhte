import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/domain/domain.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/get_the_purpose/domain/domain.dart';
import 'package:nokhte/app/core/modules/get_current_perspectives/domain/domain.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/constants/constants.dart';
import 'package:nokhte/app/core/modules/one_talker_at_a_time/domain/domain.dart';
import 'package:nokhte/app/core/modules/scheduling/domain/domain.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';
import 'package:nokhte/app/core/modules/update_existing_collaborations/domain/domain.dart';
import 'package:nokhte/app/modules/collective_session/domain/entities/entities.dart';
import 'package:nokhte/app/modules/home/domain/entities/entities.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
import 'package:nokhte/app/modules/individual_session/types/types.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/domain/domain.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';
import 'package:nokhte_backend/tables/phrase_components.dart';
import 'package:nokhte_backend/tables/timer_information.dart';
import 'package:nokhte_backend/tables/working_collaborative_documents.dart';
import 'package:nokhte_backend/tables/working_collaborative_scheduling.dart';
import 'package:nokhte_backend/tables/working_perspectives_positioning.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';

class DefaultEntities {
  static DateTime get defaultDate => DateTime.fromMillisecondsSinceEpoch(0);
  static Either<Failure, NameCreationStatusEntity>
      get nameCreationStatusEntity =>
          const Right(NameCreationStatusEntity(isSent: false));
  static Either<Failure, CollaboratorPhraseEntity>
      get collaboratorPhraseEntity =>
          const Right(CollaboratorPhraseEntity(collaboratorPhrase: ''));
  static Either<Failure, CollaboratorPhraseValidationEntity>
      get collaboratorPhraseValidationEntity =>
          Right(CollaboratorPhraseValidationEntity(
              isValid: false, phraseIDs: defaultCollaboratorPhraseIDs));
  static Either<Failure, CollaboratorPoolEntryStatusEntity>
      get collaboratorPoolEntryStatusEntity =>
          const Right(CollaboratorPoolEntryStatusEntity(hasEntered: false));
  static Either<Failure, CollaboratorPoolExitStatusEntity>
      get collaboratorPoolExitStatusEntity =>
          const Right(CollaboratorPoolExitStatusEntity(hasLeft: false));
  static Either<Failure, CollaboratorStreamStatusEntity>
      get collaboratorStreamStatusEntity =>
          const Right(CollaboratorStreamStatusEntity(isSubscribed: false));
  static CollaboratorPhraseIDs get defaultCollaboratorPhraseIDs =>
      const CollaboratorPhraseIDs(adjectiveID: -1, nounID: -1);
  static Either<Failure, ChannelIdEntity> get defaultChannelIdEntity =>
      const Right(ChannelIdEntity(channelId: ''));
  static Either<Failure, AgoraCallTokenEntity> get defaultCallTokenEntity =>
      const Right(AgoraCallTokenEntity(returnedToken: ''));
  static Either<Failure, AgoraSdkStatusEntity>
      get defaultAgoraSdkStatusEntity =>
          const Right(AgoraSdkStatusEntity(isInstantiated: false));
  static Either<Failure, WhoGetsTheQuestionEntity>
      get defaultWhoGetsQuestionEntity =>
          const Right(WhoGetsTheQuestionEntity(hasIt: false));

  static Either<Failure, SoloDocCreationStatusEntity>
      get defaultSoloDocCreationStatusEntity =>
          const Right(SoloDocCreationStatusEntity(isCreated: false));

  static Either<Failure, SoloDocContentEntity>
      get defaultSoloDocContentEntity =>
          const Right(SoloDocContentEntity(content: ''));

  static Either<Failure, SoloDocSubmissionStatusEntity>
      get defaultSoloDocSubmissionStatusEntity =>
          const Right(SoloDocSubmissionStatusEntity(isSubmitted: false));

  static Either<Failure, SoloDocSealingStatusEntity>
      get defaultSoloDocSealingStatusEntity =>
          const Right(SoloDocSealingStatusEntity(isSealed: false));

  static Either<Failure, SoloDocSharingStatusEntity>
      get defaultSoloDocSharingStatusEntity =>
          const Right(SoloDocSharingStatusEntity(isShared: false));

  static Either<Failure, CollaborativeDocCreationStatusEntity>
      get defaultCollaborativeDocCreationStatusEntity =>
          const Right(CollaborativeDocCreationStatusEntity(isCreated: false));

  static Either<Failure, CollaborativeDocUpdateStatusEntity>
      get defaultCollaborativeDocUpdateStatusEntity =>
          const Right(CollaborativeDocUpdateStatusEntity(isUpdated: false));

  static Either<Failure, CollaborativeDocPresenceUpdaterStatusEntity>
      get defaultCollaborativeDocPresenceUpdaterStatusEntity => const Right(
          CollaborativeDocPresenceUpdaterStatusEntity(isUpdated: false));

  static Either<Failure, CollaborativeDocDeltaUpdaterStatusEntity>
      get defaultCollaborativeDocDeltaUpdaterStatusEntity => const Right(
          CollaborativeDocDeltaUpdaterStatusEntity(isUpdated: false));
  static Either<Failure, CollaborativeDocUpdateCommitDesireStatusEntity>
      get collaborativeDocUpdateCommitDesireEntity => const Right(
            CollaborativeDocUpdateCommitDesireStatusEntity(isUpdated: false),
          );

  static Stream<DocInfoContent> get defaultDocContentEntity => Stream.value(
        DocInfoContent(
          currentUserUID: "",
          content: "",
          lastEditedBy: "",
          collaboratorsCommitDesireStatus: false,
          documentCommitStatus: false,
          userCommitDesireStatus: false,
        ),
      );
  static Stream<CollaboratorDocInfo> get defaultCollaboratorDocInfo =>
      Stream.value(
        CollaboratorDocInfo(
          isPresent: false,
          delta: -1,
        ),
      );
  static Stream<PerspectivesPositioning> get defaultPerspectivesStream =>
      Stream.value(PerspectivesPositioning(
        currentUserUID: "",
        collaboratorsQuadrant: -1,
        lastEditedBy: '',
        stagingAreaInfo: const [],
        usersQuadrant: -1,
      ));
  static Either<Failure, InitLeopardStatusEntity>
      get defaultInitLeopardStatusEntity =>
          const Right(InitLeopardStatusEntity(isInitialized: false));

  static Either<Failure, SpeechToTextRecordingStatusEntity>
      get defaultRecordingStatusEntity =>
          const Right(SpeechToTextRecordingStatusEntity(
              recordingStatus: SpeechToTextRecordingStatus.initial));
  static Either<Failure, AudioProcessingEntity>
      get defaultAudioProcessingEntity =>
          const Right(AudioProcessingEntity(resultingWords: ''));

  static Stream<int> get defaultCompassEvent => Stream.value(-1);

  static Either<Failure, SchedulingSessionCreationStatusEntity>
      get schedulingSessionCreationStatusEntity =>
          const Right(SchedulingSessionCreationStatusEntity(isCreated: false));
  static Either<Failure, SchedulingSessionUpdateTimeOrDateStatusEntity>
      get schedulingSessionUpdateStatusEntity => const Right(
          SchedulingSessionUpdateTimeOrDateStatusEntity(isUpdated: false));
  static Stream<CollaboratorsDateAndTime> get collaboratorsChosenTimeAndDay =>
      const Stream.empty();
  static Either<Failure, CollectivePurposeEntity> get collectivePurposeEntity =>
      const Right(CollectivePurposeEntity(thePurpose: ""));

  static Either<Failure, PerspectivesCommitStatusEntity>
      get perspectivesCommitStatusEntity =>
          const Right(PerspectivesCommitStatusEntity(isCommitted: false));

  static Either<Failure, PerspectiveSessionCreationStatusEntity>
      get perspectivesSessionCreationStatusEntity =>
          const Right(PerspectiveSessionCreationStatusEntity(isCreated: false));

  static Either<Failure, CurrentQuadrantUpdatingStatusEntity>
      get currentQuadrantUpdatingStatusEntity =>
          const Right(CurrentQuadrantUpdatingStatusEntity(isUpdated: false));

  static Either<Failure, StagingAreaUpdateStatusEntity>
      get stagingAreaUpdateStatusEntity =>
          const Right(StagingAreaUpdateStatusEntity(isUpdated: false));
  static Either<Failure, CurrentPerspectivesEntity>
      get currentPerspectivesEntity => Right(CurrentPerspectivesEntity(
          theUsersUID: '',
          currentPerspectives: const [],
          currentPerspectiveTimestamp: defaultDate));

  static Either<Failure, IndividualPerspectivesAudioUploadStatusEntity>
      get individualPerspectivesAudioUploadStatusEntity => const Right(
          IndividualPerspectivesAudioUploadStatusEntity(isUploaded: false));
  static Either<Failure, IndividualSessionCreationEntity>
      get individualSessionCreationStatusEntity =>
          Right(IndividualSessionCreationEntity(sessionTimestamp: defaultDate));
  static Either<Failure, IndividualSessionMetadataUpdateStatusEntity>
      get individualSessionMetadataUpdateStatusEntity => const Right(
          IndividualSessionMetadataUpdateStatusEntity(isUpdated: false));

  static Either<Failure, PerspectivesAudioRecordingStatusEntity>
      get perspectivesAudioRecordingStatusEntity => Right(
            PerspectivesAudioRecordingStatusEntity(
              recordingStatus: PerspectivesAudioRecordingStatus.idle,
              returnFile: File(''),
            ),
          );
  static Either<Failure, IndividualAudioMovementToCollectiveSpaceStatusEntity>
      get individualAudioMovementToCollectiveSpaceStatusEntity => const Right(
          IndividualAudioMovementToCollectiveSpaceStatusEntity(isMoved: false));

  static Either<Failure, CollaboratorPerspectivesEntity>
      get collaboratorPerspectivesEntity => const Right(
          CollaboratorPerspectivesEntity(collaboratorPerspectivesData: []));

  static CollaboratorPerspectivesEntity
      get unwrappedCollaboratorPerspectivesEntity =>
          const CollaboratorPerspectivesEntity(
              collaboratorPerspectivesData: []);
  static Either<Failure, CollectiveSessionCreationStatusEntity>
      get collectiveSessionCreationStatusEntity =>
          const Right(CollectiveSessionCreationStatusEntity(isCreated: false));
  static Either<Failure,
          InvidualMetadataAdditionToCollectiveSessionStatusEntity>
      get invidualMetadataAdditionToCollectiveSessionStatusEntity =>
          const Right(InvidualMetadataAdditionToCollectiveSessionStatusEntity(
              isAdded: true));
  static Either<Failure, ExistingCollaborationsInfoEntity>
      get existingCollaborationsInfoEntity => const Right(
            ExistingCollaborationsInfoEntity(
              hasAPurpose: false,
              hasACollaboration: false,
              hasDoneThePerspectivesSession: false,
            ),
          );

  static Either<Failure, PresenceUpdateStatusEntity>
      get presenceUpdateStatusEntity =>
          const Right(PresenceUpdateStatusEntity(isUpdated: false));

  static Either<Failure, TimerDeletionStatusEntity>
      get timerDeletionStatusEntity =>
          const Right(TimerDeletionStatusEntity(isDeleted: false));

  static Stream<PresenceAndTimeRemaining> get timerInformationStream =>
      const Stream.empty();

  static Either<Failure, TimerMarkdownStatusEntity>
      get timerMarkdownStatusEntity =>
          const Right(TimerMarkdownStatusEntity(isMarkedDown: false));

  static Either<Failure, TimerRunningUpdateStatusEntity>
      get timerRunningUpdateStatusEntity =>
          const Right(TimerRunningUpdateStatusEntity(isUpdated: false));

  static Either<Failure, TimerCreationStatusEntity>
      get timerCreationStatusEntity =>
          const Right(TimerCreationStatusEntity(isCreated: false));

  static Either<Failure, WhoIsTalkingUpdateStatusEntity>
      get whoIsTalkingUpdateStatusEntity =>
          const Right(WhoIsTalkingUpdateStatusEntity(
            isUpdated: false,
          ));
  static Either<Failure, CollaborationConsecrationStatusEntity>
      get collaborationConsecrationStatusEntity => const Right(
            CollaborationConsecrationStatusEntity(isConsecrated: false),
          );

  static Either<Failure, CollaborationActivationStatusEntity>
      get collaborationActivationStatusEntity => const Right(
            CollaborationActivationStatusEntity(isActivated: false),
          );
  static Either<Failure, IndividualCollaboratorEntryStatusEntity>
      get individualCollaboratorEntryStatusEntity => const Right(
          IndividualCollaboratorEntryStatusEntity(hasEntered: false));

  static Either<Failure, PurposeSessionArtifactAbortionStatusEntity>
      get purposeSessionArtifactAbortionStatusEntity => const Right(
          PurposeSessionArtifactAbortionStatusEntity(isAborted: false));
}
