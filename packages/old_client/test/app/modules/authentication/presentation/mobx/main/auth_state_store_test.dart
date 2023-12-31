import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/modules/authentication/presentation/mobx/main/auth_state_store.dart';
import '../../../fixtures/authentication_stack_mock_gen.mocks.dart';

void main() {
  test("On Instantiation, it properly assigns all the values of the store", () {
    final mockGetAuthStateStore = MockMGetAuthStateStore();
    when(mockGetAuthStateStore()).thenAnswer((_) => Stream.value(true));
    final authStateStore =
        AuthStateStore(authStateGetterStore: mockGetAuthStateStore);
    expect(authStateStore.authState, emitsInOrder([true]));
  });
}
