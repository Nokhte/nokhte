import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';

abstract class ActiveMonetizationSessionContract {
  Future<Either<Failure, bool>> startSession(NoParams params);
  Future<Either<Failure, bool>> updateHasFinishedExplanation(NoParams params);
  Future<Either<Failure, bool>> deleteSession(NoParams params);
  Future<Either<Failure, Stream<bool>>> listenToExplanationCompletionStatus(
    NoParams params,
  );
  bool disposeStatusStream(
    NoParams params,
  );
}
