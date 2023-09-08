// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
import '../../../../constants/entities/entities.dart';
import '../../../../fixtures/p2p_collaborator_pool_stack_mock_gen.mocks.dart';

void main() {
  late MockMExitCollaboratorPoolGetterStore mockGetterStore;
  late ExitCollaboratorPoolStore shareSoloDocStore;

  setUp(() {
    mockGetterStore = MockMExitCollaboratorPoolGetterStore();
    shareSoloDocStore = ExitCollaboratorPoolStore(
      exitCollaboratorPoolGetterStore: mockGetterStore,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      shareSoloDocStore.stateOrErrorUpdater(
        ConstantCollaboratorPoolExitStatusEntity.wrappedSuccessCase,
      );
      expect(
        shareSoloDocStore.hasLeft,
        true,
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      shareSoloDocStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(shareSoloDocStore.hasLeft, false);
      expect(
          shareSoloDocStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore()).thenAnswer(
        (_) async =>
            ConstantCollaboratorPoolExitStatusEntity.wrappedNotSuccessCase,
      );
      await shareSoloDocStore(NoParams());
      expect(
        shareSoloDocStore.hasLeft,
        false,
      );
      expect(shareSoloDocStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore()).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await shareSoloDocStore(NoParams());
      expect(shareSoloDocStore.hasLeft, false);
      expect(
          shareSoloDocStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
}
