// ignore_for_file: library_private_types_in_public_api, must_be_immutable, type_literal_in_constant_pattern
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/auth_providers.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/modules/authentication/domain/domain.dart';
import 'package:nokhte/app/modules/authentication/presentation/mobx/getters/getters.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
part 'auth_provider_store.g.dart';

class AuthProviderStore = _AuthProviderStoreBase with _$AuthProviderStore;

abstract class _AuthProviderStoreBase extends Equatable with Store {
  final GetAuthProviderStateGetterStore authProviderGetterStore;

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
