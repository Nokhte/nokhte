import 'package:primala/app/modules/authentication/domain/entities/auth_provider_entity.dart';
import 'package:primala/app/core/interfaces/auth_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthProviderModel extends AuthProviderEntity {
  const AuthProviderModel(
      {required AuthProvider authProvider, required authProviderStatus})
      : super(
          authProvider: authProvider,
          authProviderStatus: authProviderStatus,
        );

  static Future<AuthProviderModel> fromSupabase(
      Future<AuthResponse> appleAuthResponse) async {
    final res = await appleAuthResponse;
    if (res.user?.email?.isNotEmpty == true) {
      return const AuthProviderModel(
          authProvider: AuthProvider.apple, authProviderStatus: true);
    } else {
      return const AuthProviderModel(
          authProvider: AuthProvider.apple, authProviderStatus: false);
    }
  }
  // any conversion methods? look at the contract
  // let's alter it in a Test Driven way if we were to do this right
  // we would want the conversion logic here, so we didn't write tests for the
}
