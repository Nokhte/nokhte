import 'package:nokhte/app/modules/authentication/domain/domain.dart';
import 'package:nokhte/app/core/interfaces/auth_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthProviderModel extends AuthProviderEntity {
  const AuthProviderModel(
      {required super.authProvider, required super.authProviderStatus});

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
