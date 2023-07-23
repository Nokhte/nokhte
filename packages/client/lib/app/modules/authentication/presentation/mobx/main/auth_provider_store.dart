/// auth_provider_store.dart
///
/// Author: Sonny Vesali
///
/// This file defines the [AuthProviderStore] class, which is a MobX store
/// responsible for handling the logic related to authentication providers. The
/// store extends [_AuthProviderStoreBase] and interacts with the UI layer
/// through the [GetAuthProviderStateStore].
///
/// The [AuthProviderStore] manages the state of authentication providers,
/// including loading state and error messages. It contains an observable
/// [state] variable to store the current store state, and an [errorMessage]
/// variable to display any error messages during the authentication process.
///
/// The store provides a [mapFailureToMessage] method to map different [Failure]
/// types to corresponding error messages, which are displayed in case of a
/// failure during authentication.
///
/// The [routeAuthProviderRequest] method is responsible for handling
/// authentication requests from different providers. When invoked, it sets the
/// store state to [StoreState.loading], and calls the [authProviderGetterStore]
/// function from the [GetAuthProviderStateStore] to perform the authentication
/// operation. The result is then unwrapped from the [Either] type, and the
/// [errorMessageUpdater] method is called to update the error message based on
/// the result. Finally, the store state is set to [StoreState.loaded].
///
/// Note: The ignore_for_file directive is used to suppress warnings about
/// library_private_types_in_public_api and must_be_immutable.

// ignore_for_file: library_private_types_in_public_api, must_be_immutable

// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/auth_providers.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/authentication/domain/entities/auth_provider_entity.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/getters/get_auth_provider_getter_store.dart';
// * Constants
import 'package:primala/app/core/constants/failure_constants.dart';
// * Mobx Codegen Inclusion
part 'auth_provider_store.g.dart';

/// [AuthProviderStore] is a MobX store that manages the logic for handling authentication providers.
class AuthProviderStore = _AuthProviderStoreBase with _$AuthProviderStore;

/// [_AuthProviderStoreBase] is the base class that extends [Equatable] and handles the logic for authentication providers.
abstract class _AuthProviderStoreBase extends Equatable with Store {
  final GetAuthProviderStateGetterStore authProviderGetterStore;

  _AuthProviderStoreBase({required this.authProviderGetterStore});

  /// [state] holds the current store state, which includes loading and initial states.
  @observable
  StoreState state = StoreState.initial;

  /// [errorMessage] holds the error message, if any, that occurred during the authentication process.
  @observable
  String errorMessage = "";

  /// [mapFailureToMessage] maps different [Failure] types to corresponding error messages,
  /// which are displayed in case of a failure during authentication.
  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case AuthenticationFailure:
        return FailureConstants.authFailureMsg;
      case NetworkConnectionFailure:
        return FailureConstants.internetConnectionFailureMsg;
      case SupabaseFailure:
        return FailureConstants.serverFailureMsg;
      default:
        return FailureConstants.genericFailureMsg;
    }
  }

  /// [errorMessageUpdater] updates the [errorMessage] based on the result of the authentication operation,
  /// which is wrapped in an [Either] type.
  void errorMessageUpdater(Either<Failure, AuthProviderEntity> result) {
    return result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
      },
      (authStateParam) {},
    );
  }

  /// [routeAuthProviderRequest] is the method responsible for handling authentication requests from
  /// different providers. It sets the store state to [StoreState.loading], and invokes the [authProviderGetterStore]
  /// function to perform the authentication operation. The result is then unwrapped from the [Either] type,
  /// and the [errorMessageUpdater] method is called to update the error message based on the result.
  /// Finally, the store state is set to [StoreState.loaded].
  @action
  Future<void> routeAuthProviderRequest(AuthProvider authProvider) async {
    state = StoreState.loading;
    final Either<Failure, AuthProviderEntity> res =
        await authProviderGetterStore(authProvider);
    errorMessageUpdater(res);
    state = StoreState.loaded;
  }

  @override
  List<Object> get props => [errorMessage, state];
}
