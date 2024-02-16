import 'package:nokhte/app/modules/authentication/domain/entities/auth_state_entity.dart';
import 'package:nokhte/app/modules/authentication/domain/logic/get_auth_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import '../../fixtures/authentication_stack_mock_gen.mocks.dart';

void main() {
  late GetAuthState getAuthState;
  late MockMAuthenticationContract mockAuthenticationContract;
  late AuthStateEntity tAuthEntity;

  setUp(() {
    mockAuthenticationContract = MockMAuthenticationContract();
    getAuthState = GetAuthState(contract: mockAuthenticationContract);
  });

  group('Authenticated', () {
    setUp(() {
      tAuthEntity = AuthStateEntity(isAuthenticated: Stream.value(true));
    });
    test('should return the AuthEntity with true from the AuthContract', () {
      when(mockAuthenticationContract.getAuthState(NoParams()))
          .thenAnswer((_) => tAuthEntity);
      final result = getAuthState(NoParams());
      expect(result.isAuthenticated, emitsInOrder([true]));
    });
  });

  group('UnAuthenticated', () {
    setUp(() {
      tAuthEntity = AuthStateEntity(isAuthenticated: Stream.value(false));
    });
    test(
        'should return stream of a false value from the mocked auth state contract',
        () {
      when(mockAuthenticationContract.getAuthState(NoParams()))
          .thenAnswer((_) => tAuthEntity);
      final result = getAuthState(NoParams());
      expect(result.isAuthenticated, emitsInOrder([false]));
    });
  });
}
