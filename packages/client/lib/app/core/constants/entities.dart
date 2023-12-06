import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/home/domain/entities/entities.dart';
import 'package:nokhte_backend/tables/phrase_components.dart';
import 'package:nokhte_backend/tables/timer_information.dart';
import 'package:nokhte_backend/tables/working_collaborative_documents.dart';
import 'package:nokhte_backend/tables/working_perspectives_positioning.dart';

class DefaultEntities {
  static DateTime get defaultDate => DateTime.fromMillisecondsSinceEpoch(0);
  static Either<Failure, NameCreationStatusEntity>
      get nameCreationStatusEntity =>
          const Right(NameCreationStatusEntity(isSent: false));
  static Either<Failure, CollaboratorPhraseEntity>
      get collaboratorPhraseEntity =>
          const Right(CollaboratorPhraseEntity(collaboratorPhrase: ''));
  static CollaboratorPhraseIDs get defaultCollaboratorPhraseIDs =>
      const CollaboratorPhraseIDs(adjectiveID: -1, nounID: -1);

  static Stream<DocInfoContent> get defaultDocContentEntity => Stream.value(
        DocInfoContent(
          content: "",
          lastEditor: LastEditedBy.initial,
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

  static Either<Failure, ExistingCollaborationsInfoEntity>
      get existingCollaborationsInfoEntity => const Right(
            ExistingCollaborationsInfoEntity(
              hasAPurpose: false,
              hasACollaboration: false,
              hasDoneThePerspectivesSession: false,
            ),
          );

  static Stream<PresenceAndTimerCompletion> get timerInformationStream =>
      const Stream.empty();

  static DocInfoContent get docInfoContent => DocInfoContent(
        content: "",
        lastEditor: LastEditedBy.initial,
        collaboratorsCommitDesireStatus: false,
        documentCommitStatus: false,
        userCommitDesireStatus: false,
      );
}
