import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/authentication/domain/entities/auth_state_entity.dart';
import 'package:primala/app/modules/authentication/domain/entities/auth_provider_entity.dart';

abstract class AuthenticationContract {
  Future<Either<Failure, AuthProviderEntity>> googleSignIn();

  Future<Either<Failure, AuthProviderEntity>> appleSignIn();

  AuthEntity getAuthState();
}
