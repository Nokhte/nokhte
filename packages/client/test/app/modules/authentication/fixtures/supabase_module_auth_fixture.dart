// So I believe what we want are 4 different mock classes
// AuthenticatedFakeGoTrue
import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticatedAuthState extends Fake implements GoTrueClient {
  @override
  Session? get currentSession => const Session(
        accessToken: "",
        tokenType: "",
        user: User(
          id: "",
          appMetadata: {},
          userMetadata: {},
          aud: "",
          createdAt: "",
        ),
      );

  @override
  Stream<AuthState> get onAuthStateChange async* {
    final user = User(
      id: 'id',
      email: 'test@example.com',
      appMetadata: {},
      userMetadata: {},
      aud: 'aud',
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );
    final session = Session(
      accessToken: 'access_token',
      refreshToken: 'refresh_token',
      expiresIn: 3600,
      tokenType: 'bearer',
      user: user,
    );
    yield AuthState(AuthChangeEvent.signedIn, session);
  }
}

class UnauthenticatedAuthState extends Fake implements GoTrueClient {
  @override
  get currentSession => null;
  @override
  Stream<AuthState> get onAuthStateChange async* {
    const user = User(
      id: '',
      email: '',
      appMetadata: {},
      userMetadata: {},
      aud: '',
      createdAt: "",
      updatedAt: "",
    );
    const session = Session(
      accessToken: '',
      refreshToken: '',
      expiresIn: 0,
      tokenType: '',
      user: user,
    );
    yield AuthState(AuthChangeEvent.signedOut, session);
  }
}

class SuccessfulAppleSignIn extends Fake implements GoTrueClient {
  @override
  Stream<AuthState> get onAuthStateChange async* {
    final user = User(
      id: 'id',
      email: 'test@example.com',
      appMetadata: {},
      userMetadata: {},
      aud: 'aud',
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );
    final session = Session(
      accessToken: 'access_token',
      refreshToken: 'refresh_token',
      expiresIn: 3600,
      tokenType: 'bearer',
      user: user,
    );
    yield AuthState(AuthChangeEvent.signedIn, session);
  }

  Future<AuthResponse> signInWithApple() async {
    final user = User(
      id: 'id',
      email: 'test@example.com',
      appMetadata: {},
      userMetadata: {},
      aud: 'aud',
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );
    final session = Session(
      accessToken: 'access_token',
      refreshToken: 'refresh_token',
      expiresIn: 3600,
      tokenType: 'bearer',
      user: user,
    );
    return await Future.value(AuthResponse(session: session, user: user));
  }
}

class FailedAppleSignIn extends Fake implements GoTrueClient {
  Future<AuthResponse> signInWithApple() async {
    throw const AuthException("Authentication Exception");
  }

  @override
  Stream<AuthState> get onAuthStateChange async* {
    const user = User(
      id: '',
      email: '',
      appMetadata: {},
      userMetadata: {},
      aud: '',
      createdAt: "",
      updatedAt: "",
    );
    const session = Session(
      accessToken: '',
      refreshToken: '',
      expiresIn: 0,
      tokenType: '',
      user: user,
    );
    yield AuthState(AuthChangeEvent.signedOut, session);
  }
}

class SuccessfulGoogleSignIn extends Fake implements GoTrueClient {
  @override
  Stream<AuthState> get onAuthStateChange async* {
    final user = User(
      id: 'id',
      email: 'test@example.com',
      appMetadata: {},
      userMetadata: {},
      aud: 'aud',
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );
    final session = Session(
      accessToken: 'access_token',
      refreshToken: 'refresh_token',
      expiresIn: 3600,
      tokenType: 'bearer',
      user: user,
    );
    yield AuthState(AuthChangeEvent.signedIn, session);
  }

  Future<bool> signInWithOAuth(
    Provider provider, {
    String? redirectTo,
    String? scopes,
    LaunchMode authScreenLaunchMode = LaunchMode.externalApplication,
    Map<String, String>? queryParams,
  }) async {
    return Future.value(true);
  }
}

class FailedGoogleSignIn extends Fake implements GoTrueClient {
  @override
  Stream<AuthState> get onAuthStateChange async* {
    final user = User(
      id: 'id',
      email: 'test@example.com',
      appMetadata: {},
      userMetadata: {},
      aud: 'aud',
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );
    final session = Session(
      accessToken: 'access_token',
      refreshToken: 'refresh_token',
      expiresIn: 3600,
      tokenType: 'bearer',
      user: user,
    );
    yield AuthState(AuthChangeEvent.signedIn, session);
  }

  Future<bool> signInWithOAuth(
    Provider provider, {
    String? redirectTo,
    String? scopes,
    LaunchMode authScreenLaunchMode = LaunchMode.externalApplication,
    Map<String, String>? queryParams,
  }) async {
    return Future.value(false);
  }
}

enum GoTrueVersion {
  failedGoogle,
  successfulGoogle,
  failedApple,
  successfulApple,
  authenticatedAuthState,
  unAuthenticatedAuthState
}

Map goTrueMapping = {
  GoTrueVersion.failedGoogle: FailedGoogleSignIn(),
  GoTrueVersion.successfulGoogle: SuccessfulGoogleSignIn(),
  GoTrueVersion.failedApple: FailedAppleSignIn(),
  GoTrueVersion.successfulApple: SuccessfulAppleSignIn(),
  GoTrueVersion.unAuthenticatedAuthState: UnauthenticatedAuthState(),
  GoTrueVersion.authenticatedAuthState: AuthenticatedAuthState(),
};

class FakeSupabase extends Fake implements SupabaseClient {
  final GoTrueClient authClass;

  FakeSupabase(GoTrueVersion goTrueVersion)
      : authClass = goTrueMapping[goTrueVersion];

  @override
  get auth => authClass;
}
