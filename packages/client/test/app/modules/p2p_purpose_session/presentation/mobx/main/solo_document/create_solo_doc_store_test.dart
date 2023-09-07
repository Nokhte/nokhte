// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/main/solo_document/create_solo_doc_store.dart';

import '../../../../constants/entities/entities.dart';
import '../../../../fixtures/p2p_purpose_session_stack_mock_gen.mocks.dart';

void main() {
  late MockMCreateSoloDocGetterStore mockGetterStore;
  late CreateSoloDocStore createSoloDocStore;
  final tParams = NoParams();

  setUp(() {
    mockGetterStore = MockMCreateSoloDocGetterStore();
    createSoloDocStore = CreateSoloDocStore(
      getterStore: mockGetterStore,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      createSoloDocStore.stateOrErrorUpdater(
        ConstantSoloDocCreationStatusEntity.wrappedSuccessCase,
      );
      expect(
        createSoloDocStore.isCreated,
        true,
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      createSoloDocStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(createSoloDocStore.isCreated, false);
      expect(
          createSoloDocStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async => ConstantSoloDocCreationStatusEntity.wrappedSuccessCase,
      );
      await createSoloDocStore(NoParams());
      expect(
        createSoloDocStore.isCreated,
        true,
      );
      expect(createSoloDocStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await createSoloDocStore(NoParams());
      expect(createSoloDocStore.isCreated, false);
      expect(
          createSoloDocStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
}
