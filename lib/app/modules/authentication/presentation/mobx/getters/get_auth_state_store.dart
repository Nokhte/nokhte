// * Mobx Import
import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';
// * Logic import
import 'package:primala/app/modules/authentication/domain/logic/get_auth_state.dart';
// * Core imports
import 'package:primala/app/core/interfaces/logic.dart';
// * Mobx Codegen Import
part 'get_auth_state_store.g.dart';

// ignore: must_be_immutable, library_private_types_in_public_api
class GetAuthStateStore = _GetAuthStateStoreBase with _$GetAuthStateStore;

// ignore: must_be_immutable
abstract class _GetAuthStateStoreBase extends Equatable with Store {
  final GetAuthState getAuthState;

  _GetAuthStateStoreBase(this.getAuthState);
  Stream<bool> call() {
    final result = getAuthState(NoParams());
    return result.isAuthenticated;
  }

  @override
  List<Object> get props => [];
}
