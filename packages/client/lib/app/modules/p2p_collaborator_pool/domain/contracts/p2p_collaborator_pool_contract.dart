import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/domain.dart';
import 'package:nokhte_backend/constants/types/types.dart';

abstract class P2PCollaboratorPoolContract {
  Future<Either<Failure, CollaboratorPhraseValidationEntity>> validateQuery(
    String query,
  );

  Future<Either<Failure, CollaboratorPoolEntryStatusEntity>>
      enterTheCollaboratorPool({required CollaboratorPhraseIDs phraseIDs});

  Future<Either<Failure, CollaboratorPoolExitStatusEntity>>
      exitCollaboratorPool();

  Future<Either<Failure, CollaboratorSearchStatusEntity>>
      getCollaboratorSearchStatus();

  Future<Either<Failure, CollaboratorStreamStatusEntity>>
      cancelCollaboratorStream();
}
