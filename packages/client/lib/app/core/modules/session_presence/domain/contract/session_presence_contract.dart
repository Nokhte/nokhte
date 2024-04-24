import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/active_irl_nokhte_sessions/types/types.dart';

abstract class SessionPresenceContract {
  Future<Either<Failure, bool>> addContent(String params);
  Future<Either<Failure, bool>> completeTheSession(NoParams params);
  Future<Either<Failure, bool>> updateHasGyroscope(bool params);
  Future<Either<Failure, bool>> startTheSession(NoParams params);
  Future<Either<Failure, bool>> updateOnlineStatus(
      UpdatePresencePropertyParams params);
  Future<Either<Failure, bool>> updateWhoIsTalking(
      UpdateWhoIsTalkingParams params);
  Future<Either<Failure, bool>> updateCurrentPhase(double params);
  Future<Either<Failure, Stream<IrlNokhteSessionMetadata>>> getSessionMetadata(
      NoParams params);
  bool cancelSessionMetadataStream(NoParams params);
}
