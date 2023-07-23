/// get_auth_provider_getter_store.dart
///
/// Author: Sonny Vesali
///
/// This file defines the [GetAuthProviderStateGetterStore] class, a MobX getter
/// store responsible for retrieving data from the domain layer related to the
/// authentication providers. The store extends
/// [_GetAuthProviderGetterStateStoreBase] and interacts with the
/// [SignInWithApple] and [SignInWithGoogle] logic.
///
/// The [GetAuthProviderStateGetterStore] contains observables for
/// [appleSignInLogic], [googleSignInLogic], and [state]. It provides a [call]
/// method that invokes the appropriate authentication logic based on the given
/// [AuthProvider]. The method returns a [Future] of
/// [Either<Failure, AuthProviderEntity>] representing the result of the
/// authentication process, which may succeed with an [AuthProviderEntity] or
/// fail with a [Failure] object.
///
/// Note: The ignore_for_file directive is used to suppress warnings about
/// library_private_types_in_public_api and must_be_immutable.

// ignore_for_file: library_private_types_in_public_api, must_be_immutable

// * Mobx Import
import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';
// * Type Imports Import
import 'package:dartz/dartz.dart';
import 'package:primala/app/core/interfaces/auth_providers.dart';
// * Logic import
import 'package:primala/app/modules/authentication/domain/logic/sign_in_with_google.dart';
import 'package:primala/app/modules/authentication/domain/logic/sign_in_with_apple.dart';
// * Entity import
import 'package:primala/app/modules/authentication/domain/entities/auth_provider_entity.dart';
// * Core imports
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
// * Mobx Codegen Import
part 'get_auth_provider_getter_store.g.dart';

/// [GetAuthProviderStateGetterStore] is a MobX getter store responsible for retrieving
/// data from the domain layer related to the authentication providers.
class GetAuthProviderStateGetterStore = _GetAuthProviderGetterStateStoreBase
    with _$GetAuthProviderStateGetterStore;

/// [_GetAuthProviderGetterStateStoreBase] is the base class that extends [Equatable]
/// and interacts with the [SignInWithApple] and [SignInWithGoogle] logic.
abstract class _GetAuthProviderGetterStateStoreBase extends Equatable
    with Store {
  final SignInWithApple appleSignInLogic;
  final SignInWithGoogle googleSignInLogic;

  /// Initializes the store with instances of [SignInWithApple] and [SignInWithGoogle].
  _GetAuthProviderGetterStateStoreBase(
      {required SignInWithApple apple, required SignInWithGoogle google})
      : appleSignInLogic = apple,
        googleSignInLogic = google;

  @observable
  StoreState state = StoreState.initial;

  /// Invokes the appropriate authentication logic based on the given
  /// [AuthProvider]. It returns a [Future] of
  /// [Either<Failure, AuthProviderEntity>] representing the result of the
  /// authentication process.
  Future<Either<Failure, AuthProviderEntity>> call(
      AuthProvider authProvider) async {
    state = StoreState.loading;
    switch (authProvider) {
      case AuthProvider.apple:
        return appleSignInLogic(NoParams());
      case AuthProvider.google:
        return googleSignInLogic(NoParams());
    }
  }

  @override
  List<Object> get props => [state];
}
