/// authentication_contract.dart
///  Proofreading Information:
///   - Proofreader: Sonny Vesali
///   - Date: July 23rd 2023
///
/// Author: Sonny Vesali
///
/// This file defines the [AuthenticationContract] abstract class, which serves
/// as a signature for the contract implementation in the data layer. The
/// contract defines a set of methods that will be implemented in the data layer
/// to interact with various authentication functionalities.
///
/// The [AuthenticationContract] contains the following abstract methods:
/// - [googleSignIn]: A method responsible for handling Google sign-in
///   functionality. It returns a [Future] of
///   [Either<Failure, AuthProviderEntity>] that represents the result of the
///   authentication process, which may succeed with an [AuthProviderEntity] or
///   fail with a [Failure] object.
///
/// - [appleSignIn]: A method responsible for handling Apple sign-in
///   functionality. It returns a [Future] of
///   [Either<Failure, AuthProviderEntity>] that represents the result of the
///   authentication process, which may succeed with an [AuthProviderEntity]
///   or fail with a [Failure] object.
///
/// - [getAuthState]: A method that retrieves the authentication state. It
///   returns an [AuthEntity] object that represents the current authentication
///   state.
///
/// - [addNameToDatabase]: A method responsible for adding the user's name to
///   the database upon sign in or checking if it exists already. It returns a
///   [Future] of [Either<Failure, NameCreationStatusEntity>] that represents
///   the result of the name creation process, which may succeed with a
///   [NameCreationStatusEntity]  or fail with a [Failure] object.
///
/// This contract implementation will be injected into each of the logic methods
/// in the domain layer, allowing the logic to interact with the data layer
/// through these defined methods.

import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/authentication/domain/entities/auth_state_entity.dart';
import 'package:primala/app/modules/authentication/domain/entities/auth_provider_entity.dart';
import 'package:primala/app/modules/authentication/domain/entities/name_creation_status_entity.dart';

abstract class AuthenticationContract {
  Future<Either<Failure, AuthProviderEntity>> googleSignIn();

  Future<Either<Failure, AuthProviderEntity>> appleSignIn();

  AuthStateEntity getAuthState();

  Future<Either<Failure, NameCreationStatusEntity>> addNameToDatabase();
}
