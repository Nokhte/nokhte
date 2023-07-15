import 'package:primala/app/modules/authentication/data/models/auth_state_model.dart';
import 'package:primala/app/modules/authentication/data/models/auth_provider_model.dart';
import 'package:primala/app/core/interfaces/auth_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:primala/app/core/utilities/misc_algos.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:crypto/crypto.dart';
import 'package:primala_backend/user_names.dart';
import 'dart:convert';

abstract class AuthenticationRemoteSource {
  Future<AuthProviderModel> signInWithGoogle();

  Future<AuthProviderModel> signInWithApple();

  AuthModel getAuthState();

  Future<List<dynamic>> addNamesToDatabase();
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
  AuthModel getAuthState() {
    return AuthModel.fromSupabase(supabase.auth.onAuthStateChange);
  }

  @override
  addNamesToDatabase() async {
    final String fullName =
        supabase.auth.currentUser?.userMetadata?["full_name"] ??
            supabase.auth.currentUser?.userMetadata?["name"];
    final [firstName, lastName] = MiscAlgos.returnSplitName(fullName);

    final List nameCheck = await CommonUserNamesQueries.fetchUserInfo(
      supabase: supabase,
      userUID: supabase.auth.currentUser?.id ?? '',
    );

    // add check for if it already exists
    List insertRes;
    if (nameCheck.isEmpty) {
      insertRes = await CommonUserNamesQueries.insertUserInfo(
        supabase: supabase,
        userUID: supabase.auth.currentUser?.id,
        firstName: firstName,
        lastName: lastName,
      );
    } else {
      insertRes = [];
    }
    return nameCheck.isEmpty ? insertRes : nameCheck;
  }
}
