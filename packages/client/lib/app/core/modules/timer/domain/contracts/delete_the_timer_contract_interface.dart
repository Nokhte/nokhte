import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';

mixin DeleteTimerContractInterface {
  Future<Either<Failure, TimerDeletionStatusEntity>> deleteTheTimer(
      NoParams params);
}
