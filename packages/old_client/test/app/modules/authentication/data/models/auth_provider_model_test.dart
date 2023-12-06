import 'package:nokhte/app/modules/authentication/data/models/auth_provider_model.dart';
import 'package:nokhte/app/modules/authentication/domain/entities/auth_provider_entity.dart';
import 'package:nokhte/app/core/interfaces/auth_providers.dart';
import '../../fixtures/supabase_auth_fixture.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  late AuthProviderModel tAuthProvider;
  late AuthResponse tAuthResponse;

  group(
      'Apple Conversion Tests (Note: Native Apple Sign only runs conversion logic)',
      () {
    group('Authenticated', () {
      setUp(() async {
        tAuthProvider = const AuthProviderModel(
            authProvider: AuthProvider.apple, authProviderStatus: true);
        final AuthState authState =
            await SupabaseAuthFixture.authenticated().first;
        tAuthResponse = AuthResponse(
          session: authState.session,
          user: SupabaseAuthFixture.returnAuthenticatedUser(),
        );
      });
      test("should be a subclass of AuthProvider Entity", () async {
        expect(tAuthProvider, isA<AuthProviderEntity>());
      });

      test(
          "should return a valid model when user has fully completed apple authentication",
          () async {
        final AuthProviderModel result = await AuthProviderModel.fromSupabase(
          AuthProvider.apple,
          tAuthResponse,
        );

        expect(result, tAuthProvider);
      });
    });
    group('UnAuthenticated', () {
      setUp(() async {
        tAuthProvider = const AuthProviderModel(
            authProvider: AuthProvider.apple, authProviderStatus: false);
        final AuthState authState =
            await SupabaseAuthFixture.unauthenticated().first;
        tAuthResponse = AuthResponse(
          session: authState.session,
          user: SupabaseAuthFixture.returnUnauthenticatedUser(),
        );
      });
    });

    test(
        "should return a valid model when user hasn't fully completed apple authentication",
        () async {
      final AuthProviderModel result = await AuthProviderModel.fromSupabase(
        AuthProvider.apple,
        tAuthResponse,
      );
      expect(result, tAuthProvider);
    });
  });
}
