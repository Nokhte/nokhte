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
      AuthResponse appleAuthResponse, List<dynamic> dbRes, AuthProvider authProvider) async {
    if (appleAuthResponse.user?.email?.isNotEmpty == true && dbRes.isNotEmpty) {
      return  AuthProviderModel(
          authProvider: authProvider, authProviderStatus: true);
    } else {
      return AuthProviderModel(
          authProvider: authProvider, authProviderStatus: false);
    }
  }
  // any conversion methods? look at the contract
  // let's alter it in a Test Driven way if we were to do this right
  // we would want the conversion logic here, so we didn't write tests for the
}
