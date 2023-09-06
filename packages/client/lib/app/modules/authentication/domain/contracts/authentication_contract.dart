import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/authentication/domain/entities/entities.dart';

abstract class AuthenticationContract {
  Future<Either<Failure, AuthProviderEntity>> googleSignIn();

  Future<Either<Failure, AuthProviderEntity>> appleSignIn();

  AuthStateEntity getAuthState();
}
