import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';
import 'package:nokhte/app/core/modules/timer/domain/logic/create_timer.dart';

abstract class TimerContract {
  Future<Either<Failure, TimerCreationStatusEntity>> createTimer(
    CreateTimerParams params,
  );
  Future<Either<Failure, PresenceUpdateStatusEntity>> updatePresence(
    bool isPresent,
  );
  Future<Either<Failure, TimerRunningUpdateStatusEntity>>
      updateTimerRunningStatus(bool shouldRun);
}
