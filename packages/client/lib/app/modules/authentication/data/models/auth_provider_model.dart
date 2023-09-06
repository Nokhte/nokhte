// import 'package:primala/app/modules/authentication/domain/entities/auth_provider_entity.dart';
import 'package:primala/app/modules/authentication/domain/domain.dart';
import 'package:primala/app/core/interfaces/auth_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthProviderModel extends AuthProviderEntity {
  const AuthProviderModel(
      {required AuthProvider authProvider, required bool authProviderStatus})
      : super(
          authProvider: authProvider,
          authProviderStatus: authProviderStatus,
        );

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
