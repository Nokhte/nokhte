/// auth_state_store.dart
///
/// Author: Sonny Vesali
///
/// This file defines the [AuthStateStore] class, a MobX store that tracks the authentication state
/// boolean from Supabase. The store extends [_AuthStateStoreBase] and interacts with the UI layer through
/// the [GetAuthStateStore].
///
/// The [AuthStateStore] contains an observable [authState] variable that holds a boolean stream indicating
/// the current authentication state. It initializes this stream by calling the [authStateGetterStore]
/// from the [GetAuthStateStore] and converting it into a broadcast stream.
///
/// Note: The ignore_for_file directive is used to suppress warnings about library_private_types_in_public_api
/// and must_be_immutable.

// ignore_for_file: library_private_types_in_public_api, must_be_immutable

// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
// * Primala Imports
import 'package:primala/app/modules/authentication/presentation/mobx/getters/get_auth_state_getter_store.dart';
// * Mobx Codegen Inclusion
part 'auth_state_store.g.dart';

/// [AuthStateStore] is a MobX store that tracks the authentication state boolean from Supabase.
class AuthStateStore = _AuthStateStoreBase with _$AuthStateStore;

/// [_AuthStateStoreBase] is the base class that extends [Equatable] and tracks the authentication state boolean from Supabase.
abstract class _AuthStateStoreBase extends Equatable with Store {
  final GetAuthStateStore authStateGetterStore;

  _AuthStateStoreBase({
    required this.authStateGetterStore,
  }) : authState = authStateGetterStore().asBroadcastStream();

  /// [authState] holds a boolean stream indicating the current authentication state.
  @observable
  Stream<bool> authState;

  @override
  List<Object> get props => [authState];
}
