import 'package:nokhte/app/modules/authentication/data/models/auth_state_model.dart';
import 'package:nokhte/app/modules/authentication/domain/entities/auth_state_entity.dart';
import '../../fixtures/supabase_auth_fixture.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  late AuthStateModel tAuthenticatedStateModel;

  setUp(() {
    tAuthenticatedStateModel =
        AuthStateModel(isAuthenticated: Stream.value(true));
  });

  test("should be a subclass of the Authentication Entity", () async {
    expect(tAuthenticatedStateModel, isA<AuthStateEntity>());
  });
  group("fromSupabaseTypes", () {
    test(
        "should return a valid model when supabase returns an unAuthenticated User Session",
        () async {
      final Stream<AuthState> mockSupabaseSession =
          SupabaseAuthFixture.authenticated();
      final AuthStateModel result =
          AuthStateModel.fromSupabase(mockSupabaseSession);
      expect(result.isAuthenticated, emitsInOrder([true]));
    });
    test(
        "should return a valid model when supabase returns an authenticated User Session",
        () async {
      final mockSupabaseSession = SupabaseAuthFixture.unauthenticated();
      final result = AuthStateModel.fromSupabase(mockSupabaseSession);
      expect(result.isAuthenticated, emitsInOrder([false]));
    });
  });
}
