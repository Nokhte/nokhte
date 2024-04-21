import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nokhte/app/core/modules/user_information/data/data.dart';
import 'package:nokhte/app/modules/login/data/models/models.dart';
import 'package:nokhte/app/modules/login/types/login_providers.dart';
import 'package:nokhte_backend/tables/finished_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/user_names.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:nokhte/app/core/utilities/misc_algos.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

abstract class LoginRemoteSource {
  Future<AuthProviderModel> signInWithGoogle();
  Future<AuthProviderModel> signInWithApple();
  LoginStateModel getAuthState();
  Future<List> addName({String theName = ""});
  Future<List> getUserInfo();
  Future<List> getFinishedNokhteSessions();
}

class LoginRemoteSourceImpl implements LoginRemoteSource {
  final SupabaseClient supabase;
  late UserInformationRemoteSourceImpl userInfoRemoteSource;

  LoginRemoteSourceImpl({required this.supabase});

  @override
  signInWithGoogle() async {
    await dotenv.load();
    String bundleID = dotenv.env["APP_ID"] ?? '';
    if (kDebugMode && Platform.isAndroid) {
      bundleID = dotenv.env["ANDROID_APP_ID"] ?? '';
    }
    final res = await supabase.auth.signInWithOAuth(
      Provider.google,
      scopes: 'email profile openid',
      redirectTo: kIsWeb ? null : '$bundleID://login-callback',
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
    final queries = UserNamesQueries(supabase: supabase);

    await queries.insertUserInfo(firstName: firstName, lastName: lastName);
    return AuthProviderModel.fromSupabase(
      AuthProvider.apple,
      authRes,
    );
  }

  @override
  getAuthState() {
    return LoginStateModel.fromSupabase(supabase.auth.onAuthStateChange);
  }

  @override
  addName({String theName = ""}) async {
    final queries = UserNamesQueries(supabase: supabase);
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
    final queries = UserNamesQueries(supabase: supabase);
    return await queries.getUserInfo();
  }

  @override
  Future<List> getFinishedNokhteSessions() async {
    final queries = FinishedNokhteSessionQueries(supabase: supabase);
    return await queries.select();
  }
}
