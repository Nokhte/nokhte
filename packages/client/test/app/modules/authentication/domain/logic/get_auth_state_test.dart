// * Primala Domain Imports
import 'package:primala/app/modules/authentication/domain/entities/auth_state_entity.dart';
import 'package:primala/app/modules/authentication/domain/logic/get_auth_state.dart';
// * Test-Specific Imports
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
// * Primala Core Imports
import 'package:primala/app/core/interfaces/logic.dart';
// * mocks
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
      // arrange
      when(mockAuthenticationContract.getAuthState())
          .thenAnswer((_) => tAuthEntity);
      // act
      final result = getAuthState(NoParams());
      // assert
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
      // arrange
      when(mockAuthenticationContract.getAuthState())
          .thenAnswer((_) => tAuthEntity);
      // act
      final result = getAuthState(NoParams());
      // assert
      expect(result.isAuthenticated, emitsInOrder([false]));
    });
  });
}
