import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';

abstract class BasePresenceContract<T> {
  Future<Either<Failure, bool>> updateOnlineStatus(
      UpdatePresencePropertyParams params);
  Future<Either<Failure, bool>> updateWhoIsTalking(
      UpdateWhoIsTalkingParams params);
  Future<Either<Failure, bool>> updateCurrentPhase(double params);
  Future<Either<Failure, Stream<T>>> getSessionMetadata(NoParams params);
  bool cancelSessionMetadataStream(NoParams params);
}
