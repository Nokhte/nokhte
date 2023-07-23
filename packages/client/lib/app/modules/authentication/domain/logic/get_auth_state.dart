/// get_auth_state.dart
///
/// Author: Sonny Vesali
///
/// This file defines the [GetAuthState] class, a logic function in the domain layer
/// responsible for retrieving the authentication state from the Supabase client.
/// It extends [AbstractSyncNoFailureLogic] to handle synchronous operations without failures.
///
/// The [GetAuthState] class takes an [AuthenticationContract] as a dependency, which is
/// an interface that defines the methods for interacting with the authentication functionality
/// in the application.
///
/// The [call] method is overridden to perform the logic for getting the authentication state.
/// It returns an [AuthEntity] object, which is an entity representing the authentication state
/// as a boolean stream. The [AuthEntity] contains a [Stream<bool>] property named [isAuthenticated],
/// which will emit a value whenever the authentication state changes.
///
/// The [AbstractSyncNoFailureLogic] class takes two type parameters: the return entity type on
/// the [Left] and the parameter entity type on the [Right]. In this case, the [GetAuthState]
/// returns an [AuthEntity] on the [Left] and takes a [NoParams] on the [Right]. Since the
/// operation is synchronous and doesn't involve any failures, we use [AbstractSyncNoFailureLogic]
/// for this logic function.
// * Primala Domain Imports
import 'package:primala/app/modules/authentication/domain/contracts/authentication_contract.dart';
import 'package:primala/app/modules/authentication/domain/entities/auth_state_entity.dart';
// * Primala Core Imports
import 'package:primala/app/core/interfaces/logic.dart';

class GetAuthState
    extends AbstractSyncNoFailureLogic<AuthStateEntity, NoParams> {
  final AuthenticationContract contract;

  GetAuthState({required this.contract});

  @override
  AuthStateEntity call(NoParams params) => contract.getAuthState();
}
