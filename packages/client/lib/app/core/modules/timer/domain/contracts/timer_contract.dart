import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';

abstract class TimerContract {
  Future<Either<Failure, TimerCreationStatusEntity>> createTimer(
    CreateTimerParams params,
  );
  Future<Either<Failure, PresenceUpdateStatusEntity>> updatePresence(
    bool isPresent,
  );
  Future<Either<Failure, TimerRunningUpdateStatusEntity>>
      updateTimerRunningStatus(bool shouldRun);

  Future<Either<Failure, TimerDeletionStatusEntity>> deleteTheTimer(
      NoParams params);

  Future<Either<Failure, TimerMarkdownStatusEntity>> markdownTheTimer(
      NoParams params);
}
