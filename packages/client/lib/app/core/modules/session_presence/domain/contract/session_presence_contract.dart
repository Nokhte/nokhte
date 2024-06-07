import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte_backend/tables/rt_active_nokhte_sessions.dart';

abstract class SessionPresenceContract {
  Future<Either<Failure, bool>> addContent(String params);
  Future<Either<Failure, bool>> completeTheSession(NoParams params);
  Future<Either<Failure, bool>> startTheSession(NoParams params);
  Future<Either<Failure, bool>> updateOnlineStatus(
      UpdatePresencePropertyParams params);
  Future<Either<Failure, bool>> updateWhoIsTalking(
      UpdateWhoIsTalkingParams params);
  Future<Either<Failure, bool>> updateCurrentPhase(double params);
  Future<Either<Failure, Stream<NokhteSessionMetadata>>>
      listenToSessionMetadata(NoParams params);
  bool cancelSessionMetadataStream(NoParams params);
}
