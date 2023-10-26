// * Nokhte Data Import
import 'package:nokhte/app/modules/authentication/data/models/auth_state_model.dart';
// * Nokhte Domain Import
import 'package:nokhte/app/modules/authentication/domain/entities/auth_state_entity.dart';
// * Test-Specific Imports
import '../../fixtures/supabase_auth_fixture.dart';
import 'package:flutter_test/flutter_test.dart';
// * Misc Libs
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  late AuthStateModel tAuthenticatedStateModel;

  setUp(() {
    tAuthenticatedStateModel =
        AuthStateModel(isAuthenticated: Stream.value(true));
  });

  test("should be a subclass of the Authentication Entity", () async {
    //assert
    expect(tAuthenticatedStateModel, isA<AuthStateEntity>());
  });
  group("fromSupabaseTypes", () {
    test(
        "should return a valid model when supabase returns an unAuthenticated User Session",
        () async {
      //arrange
      final Stream<AuthState> mockSupabaseSession =
          SupabaseAuthFixture.authenticated();
      //act
      final AuthStateModel result =
          AuthStateModel.fromSupabase(mockSupabaseSession);
      //assert
      expect(result.isAuthenticated, emitsInOrder([true]));
    });
    test(
        "should return a valid model when supabase returns an authenticated User Session",
        () async {
      //arrange
      final mockSupabaseSession = SupabaseAuthFixture.unauthenticated();
      //act
      final result = AuthStateModel.fromSupabase(mockSupabaseSession);
      //assert
      expect(result.isAuthenticated, emitsInOrder([false]));
    });
  });
}
