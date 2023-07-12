// import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:primala/app/core/interfaces/auth_providers.dart';
import 'package:primala/app/modules/authentication/data/models/auth_state_model.dart';
import 'package:primala/app/modules/authentication/data/models/auth_provider_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart'
    hide AuthorizationRequest;
import 'package:primala/app/core/utilities/generate_random_string.dart';
import 'package:primala_backend/user_names.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
    // final res = await supabase.auth.signInWithOAuth(
    //   Provider.google,
    //   scopes: 'email profile openid',
    //   // authScreenLaunchMode: LaunchMode.inAppWebView, // <=== gives us issues
    //   redirectTo: kIsWeb ? null : 'com.primala.primala://login-callback',
    // );
    final [rawNonce, hashedNonce] = GenerateSomeRandom.rawAndHashedNonce();
    // final androidClientId = dotenv.env["ANDROID_GOOGLE_CLIENT_ID"] ?? '';
    // const packageName = 'com.primala.primala';
    // const redirectUrl = '$packageName:/google_auth';
    // const discoveryUrl =
    //     'https://accounts.google.com/.well-known/openid-configuration';

    // const appAuth = FlutterAppAuth();
    // final result = await appAuth.authorize(
    //   AuthorizationRequest(
    //     androidClientId,
    //     redirectUrl,
    //     discoveryUrl: discoveryUrl,
    //     nonce: hashedNonce,
    //     scopes: ['openid', 'email', 'profile'],
    //   ),
    // );
    // final tokenResponse = await appAuth.token(
    //   TokenRequest(
    //     androidClientId,
    //     redirectUrl,
    //     authorizationCode: result?.authorizationCode,
    //     discoveryUrl: discoveryUrl,
    //     codeVerifier: result?.codeVerifier,
    //     nonce: result?.nonce,
    //     scopes: ['openid', 'email', 'profile'],
    //   ),
    // );

    // //  ^^ I Think that this is where it comes from on the google side of things

    // final idToken = tokenResponse?.idToken ?? '';

    // final authRes = await supabase.auth.signInWithIdToken(
    //   provider: Provider.google,
    //   idToken: idToken,
    //   accessToken: tokenResponse?.accessToken,
    //   nonce: rawNonce,
    // );
    // final rawNonce = _generateRandomString();
    // final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

// Your registered Google client ID here.
// This will be different for iOS and Android
    const clientId =
        '602934273397-5ogbiqkebog5epta58mrdslioqdqne5d.apps.googleusercontent.com';

// bundle ID for iOS, package name for Android here
    final packageName = 'com.primala.primala';

    /// fixed for google login
    final redirectUrl = '$packageName:/google_auth';

    /// fixed for google login
    const discoveryUrl =
        'https://accounts.google.com/.well-known/openid-configuration';

    final appAuth = FlutterAppAuth();

// authorize the user by opening the consent page
    final result = await appAuth.authorize(
      AuthorizationRequest(
        clientId,
        redirectUrl,
        discoveryUrl: discoveryUrl,
        nonce: hashedNonce,
        scopes: [
          'openid',
          'email',
        ],
      ),
    );

    if (result == null) {
      throw AuthException(
          'Could not find AuthorizationResponse after authorizing');
    }

// Request the access and id token to google
    final tokenResponse = await appAuth.token(
      TokenRequest(
        clientId,
        redirectUrl,
        authorizationCode: result.authorizationCode,
        discoveryUrl: discoveryUrl,
        codeVerifier: result.codeVerifier,
        nonce: result.nonce,
        scopes: [
          'openid',
          'email',
        ],
      ),
    );

    final idToken = tokenResponse?.idToken;

    if (idToken == null) {
      throw const AuthException(
          'Could not find idToken from the token response');
    }

    final authRes = await supabase.auth.signInWithIdToken(
      provider: Provider.google,
      idToken: idToken,
      accessToken: tokenResponse?.accessToken,
      nonce: rawNonce,
    );

    final fullName = supabase.auth.currentUser?.userMetadata?["name"] ??
        supabase.auth.currentUser?.userMetadata?["full_name"];

    List<String> nameParts = fullName.split(' ');
    String firstName;
    String lastName;
    if (nameParts.length > 2) {
      firstName = nameParts.sublist(0, nameParts.length - 1).join(' ');
      lastName = nameParts.last;
    } else {
      firstName = nameParts[0];
      lastName = nameParts[1];
    }

    final dbRes = await CommonUserNamesQueries.insertUserInfo(
      supabase: supabase,
      userUID: supabase.auth.currentUser?.id,
      firstName: firstName,
      lastName: lastName,
    );

    return await AuthProviderModel.fromSupabase(
      authRes,
      dbRes,
      AuthProvider.google,
    );
  }

  // @ dev: Signs In User w/ Apple & Adds First & Last Name To the Backend
  @override
  Future<AuthProviderModel> signInWithApple() async {
    final [rawNonce, hashedNonce] = GenerateSomeRandom.rawAndHashedNonce();

    final credential = await SignInWithApple.getAppleIDCredential(scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ], nonce: hashedNonce);

    final firstName = credential.givenName ?? '';
    final lastName = credential.familyName ?? '';
    final idToken = credential.identityToken ?? '';

    final authRes = await supabase.auth.signInWithIdToken(
        provider: Provider.apple, idToken: idToken, nonce: rawNonce);

    final dbRes = await CommonUserNamesQueries.insertUserInfo(
      supabase: supabase,
      userUID: supabase.auth.currentUser?.id,
      firstName: firstName,
      lastName: lastName,
    );

    return await AuthProviderModel.fromSupabase(
        authRes, dbRes, AuthProvider.apple);
  }

  @override
  AuthModel getAuthState() {
    return AuthModel.fromSupabase(supabase.auth.onAuthStateChange);
  }
}
