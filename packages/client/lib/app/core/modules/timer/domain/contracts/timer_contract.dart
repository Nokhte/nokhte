import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
// import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';

abstract class TimerContract {
  Future<Either<Failure, TimerCreationStatusEntity>> createTimer(params);
  // Future<Either<Failure, returnEntity>> name(NoParams params);
  // Future<Either<Failure, returnEntity>> name(NoParams params);
  // Future<Either<Failure, returnEntity>> name(NoParams params);
}
