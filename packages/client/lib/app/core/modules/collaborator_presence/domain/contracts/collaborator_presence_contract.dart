import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';

abstract class CollaboratorPresenceContract {
  Future<Either<Failure, bool>> updateOnlineStatus(
      UpdatePresencePropertyParams params);
  Future<Either<Failure, bool>> updateOnCallStatus(
      UpdatePresencePropertyParams params);
  Future<Either<Failure, bool>> updateWhoIsTalking(
      UpdateWhoIsTalkingParams params);
  Future<Either<Failure, bool>> updateTimerStatus(bool params);
  Future<Either<Failure, bool>> updateCurrentPhase(
    UpdateCurrentPhaseParams params,
  );
  Future<Either<Failure, Stream<CollaborationSessionMetadata>>>
      getSessionMetadata(NoParams params);
}
