// ignore_for_file: library_private_types_in_public_api

// * Mobx Import
import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';
// * Logic import
import 'package:nokhte/app/modules/authentication/domain/logic/get_auth_state.dart';
// * Core imports
import 'package:nokhte/app/core/interfaces/logic.dart';
// * Mobx Codegen Import
part 'get_auth_state_getter_store.g.dart';

class GetAuthStateGetterStore = _GetAuthStateGetterStoreBase
    with _$GetAuthStateGetterStore;

abstract class _GetAuthStateGetterStoreBase extends Equatable with Store {
  final GetAuthState getAuthState;

  _GetAuthStateGetterStoreBase(this.getAuthState);

  Stream<bool> call() {
    final result = getAuthState(NoParams());
    return result.isAuthenticated;
  }

  @override
  List<Object> get props => [];
}
