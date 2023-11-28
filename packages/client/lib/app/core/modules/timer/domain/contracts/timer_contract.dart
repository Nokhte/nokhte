import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';
import 'delete_the_timer_contract_interface.dart';

abstract class TimerContract with DeleteTimerContractInterface {
  Future<Either<Failure, TimerCreationStatusEntity>> createTimer(
    CreateTimerParams params,
  );
  Future<Either<Failure, PresenceUpdateStatusEntity>> updatePresence(
    bool isPresent,
  );
  Future<Either<Failure, TimerRunningUpdateStatusEntity>>
      updateTimerRunningStatus(bool shouldRun);

  Future<Either<Failure, TimerCompletionStatusEntity>> markTimerAsComplete(
      NoParams params);

  Future<Either<Failure, TimerInformationStreamEntity>>
      getTimerInformationStream(NoParams params);
}
