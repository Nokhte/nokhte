// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
import '../../../../constants/entities/entities.dart';
import '../../../../constants/responses/responses.dart';
import '../../../../fixtures/p2p_collaborator_pool_stack_mock_gen.mocks.dart';

void main() {
  late MockMEnterCollaboratorPoolGetterStore mockGetterStore;
  late EnterCollaboratorPoolStore shareSoloDocStore;

  setUp(() {
    mockGetterStore = MockMEnterCollaboratorPoolGetterStore();
    shareSoloDocStore = EnterCollaboratorPoolStore(
      enterCollaboratorPoolGetterStore: mockGetterStore,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      shareSoloDocStore.stateOrErrorUpdater(
        ConstantCollaboratorPoolEntryStatusEntity.wrappedSuccessCase,
      );
      expect(
        shareSoloDocStore.hasEntered,
        true,
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      shareSoloDocStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(shareSoloDocStore.hasEntered, false);
      expect(
          shareSoloDocStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore(phraseIDs: PhraseIDs.phraseID)).thenAnswer(
        (_) async =>
            ConstantCollaboratorPoolEntryStatusEntity.wrappedNotSuccessCase,
      );
      await shareSoloDocStore(PhraseIDs.phraseID);
      expect(
        shareSoloDocStore.hasEntered,
        false,
      );
      expect(shareSoloDocStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore(phraseIDs: PhraseIDs.phraseID)).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await shareSoloDocStore(PhraseIDs.phraseID);
      expect(shareSoloDocStore.hasEntered, false);
      expect(
          shareSoloDocStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
}
