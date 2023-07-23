/// sign_in_with_apple.dart
///
/// Author: Sonny Vesali
///
/// This file defines the [SignInWithApple] class, a logic function in the
/// domain layer responsible for handling the sign-in with Apple authentication
/// process. It extends [AbstractFutureLogic] to handle asynchronous operations
/// that may result in failures.
///
/// The [SignInWithApple] class takes an [AuthenticationContract] as a
/// dependency, which is an interface that defines the methods for interacting
/// with the authentication functionality in the application.
///
/// The [call] method is overridden to perform the logic for signing in with
/// Apple. It returns a [Future<Either<Failure, AuthProviderEntity>>],
/// representing the result of the authentication process. The
/// [AuthProvderEntity] entity contains information about the authentication
/// provider, such as whether the sign-in was successful or not. The
/// [Either<Failure, AuthProviderEntity>] type is used to handle possible
/// failures during the asynchronous operation, where [Failure]
/// represents an error and [AuthProviderEntity] represents the result of the
/// authentication process.
///
/// The [AbstractFutureLogic] class takes two type parameters: the return entity
/// type on the [Left] and the parameter entity type on the [Right]. In this
/// case, the [SignInWithApple] returns an [AuthProviderEntity] on the [Left]
/// and takes a [NoParams] on the [Right]. Since the operation is asynchronous
/// and may involve failures, we use [AbstractFutureLogic] for this logic
/// function.

import 'package:primala/app/modules/authentication/domain/contracts/authentication_contract.dart';
import 'package:primala/app/modules/authentication/domain/entities/auth_provider_entity.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:dartz/dartz.dart';

class SignInWithApple
    extends AbstractFutureLogic<AuthProviderEntity, NoParams> {
  final AuthenticationContract contract;

  SignInWithApple({required this.contract});

  @override
  Future<Either<Failure, AuthProviderEntity>> call(NoParams params) async {
    return await contract.appleSignIn();
  }
}
