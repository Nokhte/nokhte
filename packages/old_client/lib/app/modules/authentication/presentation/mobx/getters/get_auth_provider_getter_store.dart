// ignore_for_file: library_private_types_in_public_api, must_be_immutable
import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/interfaces/auth_providers.dart';
import 'package:nokhte/app/modules/authentication/domain/domain.dart';
import 'package:nokhte/app/core/mobx/store_state.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
part 'get_auth_provider_getter_store.g.dart';

class GetAuthProviderStateGetterStore = _GetAuthProviderGetterStateStoreBase
    with _$GetAuthProviderStateGetterStore;

abstract class _GetAuthProviderGetterStateStoreBase extends Equatable
    with Store {
  final SignInWithApple appleSignInLogic;
  final SignInWithGoogle googleSignInLogic;

  _GetAuthProviderGetterStateStoreBase(
      {required SignInWithApple apple, required SignInWithGoogle google})
      : appleSignInLogic = apple,
        googleSignInLogic = google;

  @observable
  StoreState state = StoreState.initial;

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
