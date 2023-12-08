import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/authentication/domain/domain.dart';
import 'package:nokhte/app/modules/authentication/presentation/mobx/main/get_auth_state_store.dart';
import '../../../fixtures/authentication_stack_mock_gen.mocks.dart';

void main() {
  group("initial values", () {
    test("authState", () {
      final mockGetAuthState = MockGetAuthState();
      when(mockGetAuthState(NoParams())).thenAnswer(
          (_) => AuthStateEntity(isAuthenticated: Stream.value(true)));
      final authStateStore = GetAuthStateStore(logic: mockGetAuthState);
      expect(authStateStore.authState, emitsInOrder([true]));
    });
  });
}
