import 'dart:convert';

import 'package:primala/app/modules/authentication/data/models/auth_state_model.dart';
import 'package:primala/app/modules/authentication/data/models/auth_provider_model.dart';
import 'package:primala/app/core/interfaces/auth_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:primala/app/core/utilities/generate_random_string.dart';
import 'package:crypto/crypto.dart';
import 'package:primala_backend/user_names.dart';

abstract class AuthenticationRemoteSource {
  Future<AuthProviderModel> signInWithGoogle();

  Future<AuthProviderModel> signInWithApple();

  AuthModel getAuthState();

  Future<List<dynamic>> addNameToBackend({
    required String lastName,
    required String firstName,
  });
}

class AuthenticationRemoteSourceImpl implements AuthenticationRemoteSource {
  final SupabaseClient supabase;

  AuthenticationRemoteSourceImpl({required this.supabase});

  @override
  // $ Look here for changing this one to get the names 'n all that
  // $ https://supabase.com/docs/guides/auth/social-login/auth-google#using-native-sign-in
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
    // Generate a random string
    final rawNonce = GenerateSomeRandom.string();
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: hashedNonce,
    );
    final firstName = credential.givenName ?? '';
    final lastName = credential.familyName ?? '';
    final idToken = credential.identityToken ?? '';

    final authRes = await supabase.auth.signInWithIdToken(
      provider: Provider.apple,
      idToken: idToken,
      nonce: rawNonce,
    );

    final dbRes = await CommonUserNamesQueries.insertUserInfo(
      supabase: supabase,
      userUID: supabase.auth.currentUser?.id,
      firstName: firstName,
      lastName: lastName,
    );

    return await AuthProviderModel.fromSupabase(authRes, dbRes);
  }

  @override
  AuthModel getAuthState() {
    return AuthModel.fromSupabase(supabase.auth.onAuthStateChange);
  }

  @override
  Future<List<dynamic>> addNameToBackend({
    required String firstName,
    required String lastName,
  }) {
    return Future.value([]);
  }
}
