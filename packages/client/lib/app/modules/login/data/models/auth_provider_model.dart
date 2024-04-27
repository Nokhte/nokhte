import 'package:nokhte/app/modules/login/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthProviderModel extends AuthProviderEntity {
  const AuthProviderModel({
    required super.authProvider,
    required super.authProviderStatus,
  });

  factory AuthProviderModel.fromSupabase(
    AuthProvider authProvider,
    AuthResponse authResponse,
  ) {
    if (authResponse.user?.email?.isNotEmpty == true) {
      return AuthProviderModel(
          authProvider: authProvider, authProviderStatus: true);
    } else {
      return AuthProviderModel(
          authProvider: authProvider, authProviderStatus: false);
    }
  }
}
