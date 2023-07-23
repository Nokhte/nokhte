/// auth_entity.dart
///
/// Author: Sonny Vesali
///
/// This file defines the [AuthStateEntity] class, an entity that represents the
/// authentication state in the application. It wraps the [Stream<bool>] provided
/// by `supababase.auth.onAuthStateChange`, indicating whether a user is authenticated
/// or not.
///
/// The [AuthStateEntity] contains the following property:
/// - [isAuthenticated]: A [Stream<bool>] representing the authentication state.
///   The stream emits a boolean value whenever the authentication state changes.
///   A value of `true` indicates that a user is authenticated, while a value of `false`
///   indicates that no user is authenticated.
///
/// The [AuthStateEntity] is an immutable class, and it extends [Equatable] to enable easy
/// comparison of objects for equality.

import 'package:equatable/equatable.dart';

class AuthStateEntity extends Equatable {
  /// A [Stream<bool>] representing the authentication state. The stream emits a boolean
  /// value whenever the authentication state changes. A value of `true` indicates
  /// that a user is authenticated, while a value of `false` indicates that no user
  /// is authenticated.
  final Stream<bool> isAuthenticated;

  /// Constructs an [AuthStateEntity] instance with the specified [isAuthenticated] stream.
  const AuthStateEntity({required this.isAuthenticated});

  @override
  List<Object> get props => [isAuthenticated];
}
