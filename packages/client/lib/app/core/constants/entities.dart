import 'package:dartz/dartz.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:primala/app/core/modules/gyroscopic/domain/domain.dart';
import 'package:primala/app/core/modules/local_speech_to_text/constants/constants.dart';
import 'package:primala/app/modules/home/domain/entities/entities.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';
import 'package:primala/app/core/modules/voice_call/domain/domain.dart';
import 'package:primala/app/core/modules/local_speech_to_text/domain/domain.dart';
import 'package:primala/app/core/modules/solo_doc/domain/domain.dart';
import 'package:primala_backend/phrase_components.dart';
import 'package:primala_backend/working_collaborative_documents.dart';

class DefaultEntities {
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

  static Stream<DocInfoContent> get defaultDocContentEntity => Stream.value(
        DocInfoContent(
          currentUserUID: "",
          content: "",
          lastEditedBy: "",
        ),
      );
  static Stream<CollaboratorDocInfo> get defaultCollaboratorDocInfo =>
      Stream.value(
        CollaboratorDocInfo(
          isPresent: false,
          delta: -1,
        ),
      );
  static Either<Failure, InitLeopardStatusEntity>
      get defaultInitLeopardStatusEntity =>
          const Right(InitLeopardStatusEntity(isInitialized: false));

  static Either<Failure, RecordingStatusEntity>
      get defaultRecordingStatusEntity => const Right(
          RecordingStatusEntity(recordingStatus: RecordingStatus.initial));
  static Either<Failure, AudioProcessingEntity>
      get defaultAudioProcessingEntity =>
          const Right(AudioProcessingEntity(resultingWords: ''));

  static Stream<CompassEvent> get defaultCompassEvent =>
      Stream.value(CompassEvent.fromList([-1]));
}
