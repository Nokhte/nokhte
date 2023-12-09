import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../modules/authentication/fixtures/supabase_module_auth_fixture.dart';
import 'package:nokhte/app/core/guards/auth_guard.dart';
import './auth_guard_test.mocks.dart';

class MModule extends Mock implements Module {}

@GenerateMocks([MModule])
void main() {
  late SupabaseClient supabaseMock;
  late AuthGuard authGuard;

  void teeItUp(GoTrueVersion enumInput, Function body) async {
    group("AUTH GUARD $enumInput UNIT TEST", () {
      setUp(() {
        supabaseMock = FakeSupabase(enumInput);
        authGuard = AuthGuard(supabase: supabaseMock);
      });
      body();
    });
  }

  teeItUp(GoTrueVersion.authenticatedAuthState, () {
    test(
        "canActivate should return false when user has a non-null session object",
        () async {
      final res = await authGuard.canActivate(
          "", ModuleRoute("", module: MockMModule()));
      expect(res, false);
    });
  });

  teeItUp(GoTrueVersion.unAuthenticatedAuthState, () {
    test(
        "canActivate should return false when user has a non-null session object",
        () async {
      final res = await authGuard.canActivate(
          "", ModuleRoute("", module: MockMModule()));
      expect(res, true);
    });
  });
}
