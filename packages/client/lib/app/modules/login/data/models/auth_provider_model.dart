import 'package:nokhte/app/modules/login/domain/domain.dart';
import 'package:nokhte/app/modules/login/types/types.dart';
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
