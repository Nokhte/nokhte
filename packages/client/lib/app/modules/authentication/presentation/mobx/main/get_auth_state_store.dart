// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/authentication/domain/domain.dart';
part 'get_auth_state_store.g.dart';

class GetAuthStateStore = _GetAuthStateStoreBase with _$GetAuthStateStore;

abstract class _GetAuthStateStoreBase extends Equatable with Store {
  final GetAuthState logic;

  _GetAuthStateStoreBase({
    required this.logic,
  }) : authState = logic(NoParams()).isAuthenticated.asBroadcastStream();

  @observable
  Stream<bool> authState;

  @override
  List<Object> get props => [authState];
}
