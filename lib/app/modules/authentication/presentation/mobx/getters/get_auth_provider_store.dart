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
part 'get_auth_provider_store.g.dart';

// ignore: library_private_types_in_public_api, must_be_immutable
class GetAuthProviderStateStore = _GetAuthProviderStateStoreBase
    with _$GetAuthProviderStateStore;

// ignore: must_be_immutable
abstract class _GetAuthProviderStateStoreBase extends Equatable with Store {
  final SignInWithApple appleSignInLogic;
  final SignInWithGoogle googleSignInLogic;

  _GetAuthProviderStateStoreBase(
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
