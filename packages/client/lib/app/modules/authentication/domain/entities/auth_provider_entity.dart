/// auth_provider_entity.dart
/// Proofreading Information:
///   - Proofreader: Sonny Vesali
///   - Date: July 23rd 2023
///
/// Author: Sonny Vesali
///
/// This file defines the [AuthProviderEntity] class, an entity that represents
/// the status of the authentication provider sign-in calls.
///
/// The [AuthProviderEntity] contains the following properties:
/// - [authProvider]: The [AuthProvider] enum that represents the type of authentication
///   provider, such as Google or Apple.
///
/// - [authProviderStatus]: A [bool] value indicating the status of the
///   authentication provider sign-in. If the value is `true`, it indicates that
///   the sign-in was successful, the UI will only react to failures,
///   authentication status is handled by the [AuthStateEntity] which is a
///   [Stream<bool>].
///
/// The [AuthProviderEntity] is an immutable class, and it extends [Equatable]
/// to enable easy comparison of objects for equality.

import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/auth_providers.dart';

class AuthProviderEntity extends Equatable {
  /// The [AuthProvider] enum that represents the type of authentication
  /// provider, such as Google or Apple.
  final AuthProvider authProvider;

  /// A [bool] value indicating the status of the authentication provider sign-in.
  /// If the value is `true`, it indicates that the sign-in was successful, while
  /// a value of `false` indicates an unsuccessful sign-in attempt.
  final bool authProviderStatus;

  /// Constructs an [AuthProviderEntity] instance with the specified [authProvider]
  /// and [authProviderStatus].
  const AuthProviderEntity(
      {required this.authProvider, required this.authProviderStatus});

  @override
  List<Object> get props => [authProvider, authProviderStatus];
}
