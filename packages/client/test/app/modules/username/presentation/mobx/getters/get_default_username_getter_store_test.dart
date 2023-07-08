// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
// * Core
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/mobx/store_state.dart';
import 'package:primala/app/modules/username/domain/entities/default_username_entity.dart';
// * Mobx Stores
import 'package:primala/app/modules/username/presentation/mobx/getters/get_default_username_getter_store.dart';
// * Local Mock
import '../../../fixtures/username_stack_mock_gen.mocks.dart';
// * Failure Constants
import 'package:primala/app/core/constants/failure_constants.dart';

void main() {
  // declare vars
  late MockMGetDefaultUsername mockGetDefaultUsername;
  late GetDefaultUsernameGetterStore getDefaultUsernameGetterStore;
  late Either<Failure, DefaultUsernameEntity> tEitherDefaultUsernameOrFailure;

  setUp(() {
    mockGetDefaultUsername = MockMGetDefaultUsername();
    getDefaultUsernameGetterStore = GetDefaultUsernameGetterStore(
      defaultLogic: mockGetDefaultUsername,
    );
  });

  test("should set StoreState to Initial", () {
    expect(getDefaultUsernameGetterStore.state, StoreState.initial);
  });

  group("✅Success Cases", () {
    setUp(() {
      tEitherDefaultUsernameOrFailure =
          const Right(DefaultUsernameEntity(defaultUsername: "test"));
    });

    test("should pass the right entity w/ the right state", () async {
      // arrange
      when(mockGetDefaultUsername(NoParams())).thenAnswer(
          (realInvocation) async => tEitherDefaultUsernameOrFailure);
      // act
      final res = await getDefaultUsernameGetterStore();
      //assert
      expect(res, tEitherDefaultUsernameOrFailure);
    });
  });
  group("❌Failure Cases", () {
    setUp(() {
      tEitherDefaultUsernameOrFailure = Left(FailureConstants.dbFailure);
    });

    test("should pass the right entity w/ the right state", () async {
      // arrange
      when(mockGetDefaultUsername(NoParams())).thenAnswer(
          (realInvocation) async => tEitherDefaultUsernameOrFailure);
      // act
      final res = await getDefaultUsernameGetterStore();
      //assert
      expect(res, tEitherDefaultUsernameOrFailure);
    });
  });
}
