// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
// * Primala Imports
import 'package:primala/app/modules/authentication/presentation/mobx/getters/get_auth_state_store.dart';
// * Mobx Codegen Inclusion
part 'auth_state_store.g.dart';

// ignore: must_be_immutable, library_private_types_in_public_api
class AuthStateStore = _AuthStateStoreBase with _$AuthStateStore;

// ignore: must_be_immutable
abstract class _AuthStateStoreBase extends Equatable with Store {
  final GetAuthStateStore authStateGetterStore;

  _AuthStateStoreBase({
    required this.authStateGetterStore,
  }) : authState = authStateGetterStore().asBroadcastStream();

  @observable
  Stream<bool> authState;

  @override
  List<Object> get props => [authState];
}
