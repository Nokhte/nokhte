/// authentication_remote_source.dart
///
/// Author: Sonny Vesali
///
/// This file defines the [AuthenticationRemoteSource] abstract class and its
/// implementation, [AuthenticationRemoteSourceImpl]. The
/// [AuthenticationRemoteSource] provides contract methods for interacting with
/// external authentication providers and the Supabase authentication.
///
/// The implementation class, [AuthenticationRemoteSourceImpl], uses the
/// Supabase client to perform authentication operations with Google and Apple.
/// It also retrieves the authentication state and adds names to the database.
///
/// Note: The ignore_for_file directive is used to suppress warnings about
/// depend_on_referenced_packages.
// ignore_for_file: depend_on_referenced_packages

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

/// [AuthenticationRemoteSource] is an abstract class that defines contract
/// methods for interacting with external authentication providers and Supabase
/// authentication.
abstract class AuthenticationRemoteSource {
  /// Sign in with Google and return the corresponding [AuthProviderModel].
  Future<AuthProviderModel> signInWithGoogle();

  /// Sign in with Apple and return the corresponding [AuthProviderModel].
  Future<AuthProviderModel> signInWithApple();

  /// Get the authentication state and return the corresponding
  /// [AuthStateModel].
  AuthStateModel getAuthState();

  /// Add names to the database and return the result as a [Future] of
  /// [List<dynamic>].
  Future<List<dynamic>> addNamesToDatabase();
}

/// [AuthenticationRemoteSourceImpl] is an implementation of [AuthenticationRemoteSource] that uses the Supabase client to perform authentication operations with Google and Apple.
class AuthenticationRemoteSourceImpl implements AuthenticationRemoteSource {
  final SupabaseClient supabase;

  /// Constructs an [AuthenticationRemoteSourceImpl] instance with the provided
  /// [supabase] client.
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
  AuthStateModel getAuthState() {
    return AuthStateModel.fromSupabase(supabase.auth.onAuthStateChange);
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
