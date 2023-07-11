// * Primala Data Import
import 'package:primala/app/modules/authentication/data/models/auth_provider_model.dart';
// * Primala Domain Import
import 'package:primala/app/modules/authentication/domain/entities/auth_provider_entity.dart';
// * Primala Core Import
import 'package:primala/app/core/interfaces/auth_providers.dart';
// * Test-Specific Imports
import '../../fixtures/supabase_auth_fixture.dart';
import 'package:flutter_test/flutter_test.dart';
// * Misc Libs
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  late AuthProviderModel tAuthProvider;
  late AuthResponse tAuthResponse;
  late List<dynamic> tDBResponse;

  group(
      'Apple Conversion Tests (Note: Native Apple Sign only runs conversion logic)',
      () {
    group('Authenticated', () {
      setUp(() async {
        // * arrange
        tAuthProvider = const AuthProviderModel(
            authProvider: AuthProvider.apple, authProviderStatus: true);
        tDBResponse = [{}];
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
        // * act
        final AuthProviderModel result = await AuthProviderModel.fromSupabase(
          tAuthResponse,
          tDBResponse,
        );

        // * assert
        expect(result, tAuthProvider);
      });
    });
    group('UnAuthenticated', () {
      setUp(() async {
        // * arrange
        tAuthProvider = const AuthProviderModel(
            authProvider: AuthProvider.apple, authProviderStatus: false);
        tDBResponse = [];
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
      // * act
      final AuthProviderModel result = await AuthProviderModel.fromSupabase(
        tAuthResponse,
        tDBResponse,
      );
      // * assert
      expect(result, tAuthProvider);
    });
  });
}
