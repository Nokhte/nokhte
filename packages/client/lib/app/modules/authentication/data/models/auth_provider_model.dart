/// auth_provider_model.dart
///
/// Author: Sonny Vesali
///
/// This file defines the [AuthProviderModel] class, which extends
/// [AuthProviderEntity]. The [AuthProviderModel] is a model class that
/// represents the authentication provider sign-in status from the remote
/// source. Similar to [AuthStateModel], it serves as an intermediate
/// abstraction between the external library, Supabase, and our application's
/// domain logic.
///
/// The [AuthProviderModel] constructor takes an [AuthProvider] parameter,
/// [authProvider], and a [bool] parameter, [authProviderStatus], and calls the
/// constructor of [AuthProviderEntity] to initialize the authentication
/// provider's sign-in status. The [authProvider] specifies the type of
/// authentication provider (e.g., Google, Apple), and [authProviderStatus]
/// indicates whether the user is successfully signed in with the specified
/// provider.
///
/// The [fromSupabase] factory method creates an [AuthProviderModel] instance
/// from the provided [authProvider] and [authResponse] from Supabase. Based on
/// the [authResponse], which contains user information, the method checks
/// whether the user's email is not empty to determine  the success of the
/// authentication provider sign-in. If the email is not empty,
/// [authProviderStatus] is set to true; otherwise, it is set to false.
///
/// As with [AuthStateModel], the [AuthProviderModel] follows the dependency
/// inversion principle, as it converts data from the external library into
/// terms controlled by our application. This separation of concerns and
/// abstraction of the authentication provider's sign-in status promote better
/// code maintainability and flexibility.

import 'package:primala/app/modules/authentication/domain/entities/auth_provider_entity.dart';
import 'package:primala/app/core/interfaces/auth_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthProviderModel extends AuthProviderEntity {
  /// Constructs an [AuthProviderModel] instance with the specified
  /// [authProvider] and [authProviderStatus].
  const AuthProviderModel(
      {required AuthProvider authProvider, required bool authProviderStatus})
      : super(
          authProvider: authProvider,
          authProviderStatus: authProviderStatus,
        );

  /// Creates an [AuthProviderModel] from the provided [authProvider] and
  /// [authResponse] from Supabase.
  static Future<AuthProviderModel> fromSupabase(
    AuthProvider authProvider,
    AuthResponse authResponse,
  ) async {
    if (authResponse.user?.email?.isNotEmpty == true) {
      return AuthProviderModel(
          authProvider: authProvider, authProviderStatus: true);
    } else {
      return AuthProviderModel(
          authProvider: authProvider, authProviderStatus: false);
    }
  }
}
