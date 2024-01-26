import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/authentication/domain/entities/auth_state_entity.dart';
import 'package:nokhte/app/modules/authentication/presentation/mobx/getters/get_auth_state_getter_store.dart';
import '../../../fixtures/authentication_stack_mock_gen.mocks.dart';

void main() {
  late MockMGetAuthState mockAuthStateGetter;
  late GetAuthStateGetterStore getAuthStateStore;

  setUp(() {
    mockAuthStateGetter = MockMGetAuthState();
    getAuthStateStore = GetAuthStateGetterStore(mockAuthStateGetter);
  });

  test("should call the auth state logic and return the result", () {
    when(mockAuthStateGetter(NoParams())).thenAnswer((realInvocation) =>
        AuthStateEntity(isAuthenticated: Stream.value(true)));
    final result = getAuthStateStore();
    expect(result, emitsInOrder([true]));
  });
}
