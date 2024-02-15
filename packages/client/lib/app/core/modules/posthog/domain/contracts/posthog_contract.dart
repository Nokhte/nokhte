import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/posthog/constants/screens.dart';

abstract class PosthogContract {
  Future<Either<Failure, Null>> identifyUser(NoParams params);
  Future<Either<Failure, Null>> captureNokhteSessionStart(NoParams params);
  Future<Either<Failure, Null>> captureNokhteSessionEnd(NoParams params);
  Future<Either<Failure, Null>> captureShareNokhteSessionInvitation(
    NoParams params,
  );
  Future<Either<Failure, Null>> captureScreen(Screens screen);
}
