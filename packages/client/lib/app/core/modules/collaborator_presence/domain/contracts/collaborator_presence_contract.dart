import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';

abstract class CollaboratorPresenceContract {
  Future<Either<Failure, OnlineUpdateStatusEntity>> updateOnlineStatus(
      UpdatePresencePropertyParams params);
  Future<Either<Failure, CallUpdateStatusEntity>> updateOnCallStatus(
      UpdatePresencePropertyParams params);
  Future<Either<Failure, WhoIsTalkingUpdateStatusEntity>> updateWhoIsTalking(
      UpdateWhoIsTalkingParams params);
  Future<Either<Failure, TimerUpdateStatusEntity>> updateTimerStatus(
      bool params);
  Future<Either<Failure, PhaseUpdateStatusEntity>> updateCurrentPhase(
    UpdateCurrentPhaseParams params,
  );
  Future<Either<Failure, Stream<CollaborationSessionMetadata>>>
      getSessionMetadata(NoParams params);
}
