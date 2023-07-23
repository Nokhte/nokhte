/// sign_in_with_google.dart
///
/// Author: Sonny Vesali
///
/// This file defines the [SignInWithGoogle] class, a logic function in the
/// domain layer responsible for handling the sign-in with Google authentication
/// process. It extends [AbstractFutureLogic] to handle asynchronous operations
/// that may result in failures.
///
/// The [SignInWithGoogle] class takes an [AuthenticationContract] as a
/// dependency, which is an interface that defines the methods for interacting
/// with the authentication functionality in the application.
///
/// The [call] method is overridden to perform the logic for signing in with
/// Google. It returns a [Future<Either<Failure, AuthProviderEntity>>],
/// representing the result of the authentication process. The
/// [AuthProvderEntity] entity contains information about the authentication
/// provider, such as whether the sign-in was successful or not. The
/// [Either<Failure, AuthProviderEntity>] type is used to handle possible
/// failures during the asynchronous operation, where [Failure] represents an
/// error and [AuthProviderEntity] represents the result of the authentication
/// process.
///
/// The [AbstractFutureLogic] class takes two type parameters: the return entity
/// type on the [Left] and the parameter entity type on the [Right]. In this
/// case, the [SignInWithGoogle] returns an [AuthProviderEntity] on the [Left]
/// and takes a [NoParams] on the [Right]. Since the operation is asynchronous
/// and may involve failures, we use [AbstractFutureLogic] for this logic
/// function.
// * Primala Domain Imports
import 'package:primala/app/modules/authentication/domain/contracts/authentication_contract.dart';
import 'package:primala/app/modules/authentication/domain/entities/auth_provider_entity.dart';
// * Primala Core Imports
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
// * Miscc Libs
import 'package:dartz/dartz.dart';

class SignInWithGoogle
    extends AbstractFutureLogic<AuthProviderEntity, NoParams> {
  final AuthenticationContract contract;

  SignInWithGoogle({required this.contract});

  @override
  Future<Either<Failure, AuthProviderEntity>> call(NoParams params) async {
    return await contract.googleSignIn();
  }
}
