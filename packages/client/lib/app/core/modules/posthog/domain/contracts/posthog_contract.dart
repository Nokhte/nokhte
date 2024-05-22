import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';

abstract class PosthogContract {
  Future<Either<Failure, Null>> identifyUser(NoParams params);
  Future<Either<Failure, Null>> captureNokhteSessionStart(NoParams params);
  Future<Either<Failure, Null>> captureNokhteSessionEnd(NoParams params);
  Future<Either<Failure, Null>> captureShareNokhteSessionInvitation(
    NoParams params,
  );
  Future<Either<Failure, Null>> captureScreen(String screenRoute);
}
