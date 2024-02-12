import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/authentication/domain/entities/entities.dart';

abstract class AuthenticationContract {
  Future<Either<Failure, AuthProviderEntity>> googleSignIn(NoParams params);

  Future<Either<Failure, AuthProviderEntity>> appleSignIn(NoParams params);

  Future<Either<Failure, bool>> addName(NoParams params);

  AuthStateEntity getAuthState(NoParams params);
}
