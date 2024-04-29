import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/modules/login/login.dart';

abstract class LoginContract extends BaseGetUserInfoContract {
  Future<Either<Failure, AuthProviderEntity>> googleSignIn(NoParams params);

  Future<Either<Failure, AuthProviderEntity>> appleSignIn(NoParams params);

  Future<Either<Failure, bool>> addName(NoParams params);

  Stream<bool> getAuthState(NoParams params);
}
