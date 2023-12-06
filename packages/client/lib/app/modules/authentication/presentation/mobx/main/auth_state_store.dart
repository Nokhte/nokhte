// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/modules/authentication/presentation/mobx/getters/get_auth_state_getter_store.dart';
part 'auth_state_store.g.dart';

class AuthStateStore = _AuthStateStoreBase with _$AuthStateStore;

abstract class _AuthStateStoreBase extends Equatable with Store {
  final GetAuthStateGetterStore authStateGetterStore;

  _AuthStateStoreBase({
    required this.authStateGetterStore,
  }) : authState = authStateGetterStore().asBroadcastStream();

  @observable
  Stream<bool> authState;

  @override
  List<Object> get props => [authState];
}
