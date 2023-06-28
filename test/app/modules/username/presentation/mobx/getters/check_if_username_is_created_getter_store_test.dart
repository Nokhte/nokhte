// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
// * Core
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/store_state.dart';
// * Entities
import 'package:primala/app/modules/username/domain/entities/username_status_entity.dart';
// * Mobx Stores
import 'package:primala/app/modules/username/presentation/mobx/getters/check_if_username_is_created_getter_store.dart';
// * local mocks
import '../../../fixtures/username_stack_mock_gen.mocks.dart';
// * Failure Constants
import 'package:primala/app/core/constants/failure_constants.dart';

void main() {
  // declare vars
  late MockMCheckIfUsernameIsCreated mockCheckUsername;
  late CheckIfUsernameIsCreatedGetterStore checkUsernameGetterStore;
  late Either<Failure, UsernameStatusEntity> tEitherUsernameStatusOrFailure;

  setUp(() {
    mockCheckUsername = MockMCheckIfUsernameIsCreated();
    checkUsernameGetterStore =
        CheckIfUsernameIsCreatedGetterStore(checkLogic: mockCheckUsername);
  });

  test("should set StoreState to Initial", () {
    expect(checkUsernameGetterStore.state, StoreState.initial);
  });

  group("✅ SUCCESS Cases", () {
    setUp(() {
      tEitherUsernameStatusOrFailure =
          const Right(UsernameStatusEntity(isCreated: true));
    });
    test("should pass the right entity w/ the right state", () async {
      //arrange
      when(mockCheckUsername(NoParams()))
          .thenAnswer((realInvocation) async => tEitherUsernameStatusOrFailure);
      //act
      final res = await checkUsernameGetterStore();
      //assert
      expect(res, tEitherUsernameStatusOrFailure);
    });
  });
  group("❌ FAILURE Cases", () {
    setUp(() {
      tEitherUsernameStatusOrFailure = Left(FailureConstants.dbFailure);
    });
    test("should pass the right entity w/ the right state", () async {
      //arrange
      when(mockCheckUsername(NoParams()))
          .thenAnswer((realInvocation) async => tEitherUsernameStatusOrFailure);
      //act
      final res = await checkUsernameGetterStore();
      //assert
      expect(res, tEitherUsernameStatusOrFailure);
    });
  });
}
