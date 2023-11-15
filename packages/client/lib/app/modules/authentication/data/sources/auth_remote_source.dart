import 'package:nokhte/app/modules/authentication/data/models/models.dart';
import 'package:nokhte/app/core/interfaces/auth_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:nokhte/app/core/utilities/misc_algos.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

abstract class AuthenticationRemoteSource {
  Future<AuthProviderModel> signInWithGoogle();
  Future<AuthProviderModel> signInWithApple();
  AuthStateModel getAuthState();
}

class AuthenticationRemoteSourceImpl implements AuthenticationRemoteSource {
  final SupabaseClient supabase;

  AuthenticationRemoteSourceImpl({required this.supabase});

  @override
  Future<AuthProviderModel> signInWithGoogle() async {
    final res = await supabase.auth.signInWithOAuth(
      Provider.google,
      scopes: 'email profile openid',
      redirectTo: kIsWeb ? null : 'com.nokhte.nokhte://login-callback',
    );
    return AuthProviderModel(
        authProvider: AuthProvider.google, authProviderStatus: res);
  }

  @override
  Future<AuthProviderModel> signInWithApple() async {
    final rawNonce = MiscAlgos.generateRandomString();
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: hashedNonce,
    );
    final idToken = credential.identityToken ?? '';

    final authRes = await supabase.auth.signInWithIdToken(
      provider: Provider.apple,
      idToken: idToken,
      nonce: rawNonce,
    );

    return AuthProviderModel.fromSupabase(
      AuthProvider.apple,
      authRes,
    );
  }

  @override
  AuthStateModel getAuthState() {
    return AuthStateModel.fromSupabase(supabase.auth.onAuthStateChange);
  }
}
