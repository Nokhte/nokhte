// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/modules/solo_doc/mobx/mobx.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/solo_doc_mock_gen.mocks.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';

void main() {
  late MockMCreateSoloDocGetterStore mockGetterStore;
  late CreateSoloDocStore createSoloDocStore;
  const tParams = CreateSoloDocParams(docType: 'purpose');

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
      await createSoloDocStore(tParams);
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
      await createSoloDocStore(tParams);
      expect(createSoloDocStore.isCreated, false);
      expect(
          createSoloDocStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
}
