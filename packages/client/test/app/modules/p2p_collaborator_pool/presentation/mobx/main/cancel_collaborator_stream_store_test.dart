import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/presentation/presentation.dart';
import '../../../constants/entities/entities.dart';
import '../../../fixtures/p2p_collaborator_pool_stack_mock_gen.mocks.dart';

void main() {
  late MockMCancelCollaboratorStreamGetterStore mockGetterStore;
  late CancelCollaboratorStreamStore cancelCollaboratorStreamStore;
  final tParams = NoParams();

  setUp(() {
    mockGetterStore = MockMCancelCollaboratorStreamGetterStore();
    cancelCollaboratorStreamStore = CancelCollaboratorStreamStore(
      getterStore: mockGetterStore,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      cancelCollaboratorStreamStore.stateOrErrorUpdater(
        ConstantCollaboratorStreamStatusEntity.wrappedSuccessCase,
      );
      expect(
        cancelCollaboratorStreamStore.isListening,
        true,
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      cancelCollaboratorStreamStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(cancelCollaboratorStreamStore.isListening, false);
      expect(cancelCollaboratorStreamStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore()).thenAnswer(
        (_) async =>
            ConstantCollaboratorStreamStatusEntity.wrappedNotSuccessCase,
      );
      await cancelCollaboratorStreamStore(tParams);
      expect(
        cancelCollaboratorStreamStore.isListening,
        false,
      );
      expect(cancelCollaboratorStreamStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore()).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await cancelCollaboratorStreamStore(tParams);
      expect(cancelCollaboratorStreamStore.isListening, false);
      expect(cancelCollaboratorStreamStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });
}
