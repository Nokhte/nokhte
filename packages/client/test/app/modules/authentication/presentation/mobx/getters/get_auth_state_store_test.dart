// * Testing & Mocking Libs
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/authentication/domain/entities/auth_state_entity.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/getters/get_auth_state_store.dart';
import '../../../fixtures/authentication_stack_mock_gen.mocks.dart';

void main() {
  late MockMGetAuthState mockAuthStateGetter;
  late GetAuthStateStore getAuthStateStore;
  // late AuthEntity tAuthLogicResult;

  setUp(() {
    mockAuthStateGetter = MockMGetAuthState();
    getAuthStateStore = GetAuthStateStore(mockAuthStateGetter);
  });

  test("should call the auth state logic and return the result", () {
    // arrange
    when(mockAuthStateGetter(NoParams())).thenAnswer(
        (realInvocation) => AuthEntity(isAuthenticated: Stream.value(true)));
    // act
    final result = getAuthStateStore();
    expect(result, emitsInOrder([true]));
  });
}
