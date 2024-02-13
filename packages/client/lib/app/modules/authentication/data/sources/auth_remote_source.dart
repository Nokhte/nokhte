import 'package:nokhte/app/core/modules/user_information/data/data.dart';
import 'package:nokhte/app/modules/authentication/data/models/models.dart';
import 'package:nokhte/app/core/interfaces/auth_providers.dart';
import 'package:nokhte_backend/tables/user_names.dart';
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
  Future<List> addName({String theName = ""});
  Future<List> getUserInfo();
}

class AuthenticationRemoteSourceImpl implements AuthenticationRemoteSource {
  final SupabaseClient supabase;
  late UserNamesQueries queries;
  late UserInformationRemoteSourceImpl userInfoRemoteSource;

  AuthenticationRemoteSourceImpl({required this.supabase})
      : queries = UserNamesQueries(supabase: supabase);

  @override
  signInWithGoogle() async {
    final res = await supabase.auth.signInWithOAuth(
      Provider.google,
      scopes: 'email profile openid',
      redirectTo: kIsWeb ? null : 'com.nokhte.nokhte://login-callback',
    );
    return AuthProviderModel(
        authProvider: AuthProvider.google, authProviderStatus: res);
  }

  @override
  signInWithApple() async {
    final rawNonce = MiscAlgos.generateRandomString();
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
    queries = UserNamesQueries(supabase: supabase);

    await queries.insertUserInfo(firstName: firstName, lastName: lastName);
    return AuthProviderModel.fromSupabase(
      AuthProvider.apple,
      authRes,
    );
  }

  @override
  getAuthState() {
    return AuthStateModel.fromSupabase(supabase.auth.onAuthStateChange);
  }

  @override
  addName({String theName = ""}) async {
    queries = UserNamesQueries(supabase: supabase);
    final List nameCheck = await queries.getUserInfo();
    List insertRes;
    String fullName;
    if (nameCheck.isEmpty) {
      if (theName.isEmpty) {
        fullName = supabase.auth.currentUser?.userMetadata?["full_name"] ??
            supabase.auth.currentUser?.userMetadata?["name"] ??
            supabase.auth.currentUser?.userMetadata?["email"];
      } else {
        fullName = theName;
      }
      final [firstName, lastName] = MiscAlgos.returnSplitName(fullName);

      insertRes = await queries.insertUserInfo(
        firstName: firstName,
        lastName: lastName,
      );
    } else {
      insertRes = [];
    }
    return nameCheck.isEmpty ? insertRes : nameCheck;
  }

  @override
  Future<List> getUserInfo() async {
    queries = UserNamesQueries(supabase: supabase);
    return await queries.getUserInfo();
  }
}
