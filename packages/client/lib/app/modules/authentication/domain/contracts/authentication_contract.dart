import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/authentication/domain/entities/entities.dart';

abstract class AuthenticationContract {
  Future<Either<Failure, AuthProviderEntity>> googleSignIn();

  Future<Either<Failure, AuthProviderEntity>> appleSignIn();

  AuthStateEntity getAuthState();
}
