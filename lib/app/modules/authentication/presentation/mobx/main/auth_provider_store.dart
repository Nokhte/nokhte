// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/auth_providers.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/authentication/domain/entities/auth_provider_entity.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/getters/get_auth_provider_store.dart';
// * Constants
import 'package:primala/app/core/constants/failure_constants.dart';
// * Mobx Codegen Inclusion
part 'auth_provider_store.g.dart';

// ignore: library_private_types_in_public_api, must_be_immutable
class AuthProviderStore = _AuthProviderStoreBase with _$AuthProviderStore;

// ignore: must_be_immutable
abstract class _AuthProviderStoreBase extends Equatable with Store {
  final GetAuthProviderStateStore authProviderGetterStore;

  _AuthProviderStoreBase({required this.authProviderGetterStore});

  @observable
  StoreState state = StoreState.initial;

  @observable
  String errorMessage = "";

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

  void errorMessageUpdater(Either<Failure, AuthProviderEntity> result) {
    return result.fold(
      (failure) {
        errorMessage = mapFailureToMessage(failure);
      },
      (authStateParam) {},
    );
  }

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
