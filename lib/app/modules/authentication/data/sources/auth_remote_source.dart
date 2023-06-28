import 'package:primala/app/modules/authentication/data/models/auth_state_model.dart';
import 'package:primala/app/modules/authentication/data/models/auth_provider_model.dart';
import 'package:primala/app/core/interfaces/auth_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart';

abstract class AuthenticationRemoteSource {
  Future<AuthProviderModel> signInWithGoogle();

  Future<AuthProviderModel> signInWithApple();

  AuthModel getAuthState();
}

class AuthenticationRemoteSourceImpl implements AuthenticationRemoteSource {
  final SupabaseClient supabase;

  AuthenticationRemoteSourceImpl({required this.supabase});

  @override
  Future<AuthProviderModel> signInWithGoogle() async {
    final res = await supabase.auth.signInWithOAuth(
      Provider.google,
      scopes: 'email profile openid',
      // authScreenLaunchMode: LaunchMode.inAppWebView, // <=== gives us issues
      redirectTo: kIsWeb ? null : 'com.primala.primala://login-callback',
    );
    return AuthProviderModel(
        authProvider: AuthProvider.google, authProviderStatus: res);
  }

  @override
  Future<AuthProviderModel> signInWithApple() async {
    final res = supabase.auth.signInWithApple();
    return await AuthProviderModel.fromSupabase(res);
  }

  @override
  AuthModel getAuthState() {
    return AuthModel.fromSupabase(supabase.auth.onAuthStateChange);
  }
}
