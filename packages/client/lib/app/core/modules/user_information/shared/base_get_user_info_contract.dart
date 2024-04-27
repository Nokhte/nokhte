import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';

abstract class BaseGetUserInfoContract {
  Future<Either<Failure, UserJourneyInfoEntity>> getUserInfo(NoParams params);
}
