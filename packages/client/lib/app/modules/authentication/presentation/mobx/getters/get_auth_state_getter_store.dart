/// get_auth_state_store.dart
///
/// Author: Sonny Vesali
///
/// This file defines the [GetAuthStateStore] class, a MobX getter store that
/// retrieves data from the domain layer. The store extends
/// [_GetAuthStateStoreBase] and interacts with the  [GetAuthState] logic for
/// the [GetAuthStateStore]
///
/// The [GetAuthStateStore] contains an observable [getAuthState]variable that
/// holds the [GetAuthState] logic instance. It provides a [call] method that
/// invokes the [getAuthState] to get the authentication state by passing a
/// [NoParams] object. The method returns a [Stream<bool>] representing the
/// authentication state, which will emit a value whenever the authentication
/// state changes.
///
/// Note: The ignore_for_file directive is used to suppress warnings about
/// library_private_types_in_public_api and must_be_immutable.

// ignore_for_file: library_private_types_in_public_api

// * Mobx Import
import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';
// * Logic import
import 'package:primala/app/modules/authentication/domain/logic/get_auth_state.dart';
// * Core imports
import 'package:primala/app/core/interfaces/logic.dart';
// * Mobx Codegen Import
part 'get_auth_state_getter_store.g.dart';

/// [GetAuthStateStore] is a MobX getter store that retrieves data from the
/// domain layer.
class GetAuthStateGetterStore = _GetAuthStateGetterStoreBase
    with _$GetAuthStateGetterStore;

/// [_GetAuthStateGetterStoreBase] is the base class that extends [Equatable] and
/// interacts with the [GetAuthState] logic.
abstract class _GetAuthStateGetterStoreBase extends Equatable with Store {
  final GetAuthState getAuthState;

  _GetAuthStateGetterStoreBase(this.getAuthState);

  /// The [call] method invokes the [getAuthState] to get the authentication
  /// state by passing a [NoParams] object. The method returns a [Stream<bool>]
  /// representing the authentication state, which will emit a value whenever
  /// the authentication state changes.
  Stream<bool> call() {
    final result = getAuthState(NoParams());
    return result.isAuthenticated;
  }

  @override
  List<Object> get props => [];
}
