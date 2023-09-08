import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/entities/entities.dart';

abstract class P2PPurposeSessionCollaborativeDocContract {
  Future<Either<Failure, CollaborativeDocContentEntity>>
      getCollaborativeDocContent();
  Future<Either<Failure, CollaborativeDocCollaboratorDeltaEntity>>
      getCollaboratorDelta();
  Future<Either<Failure, CollaborativeDocCollaboratorPresenceEntity>>
      getCollaboratorPresence();
}
