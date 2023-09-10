// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/modules/solo_doc/mobx/mobx.dart';
import 'package:primala/app/core/modules/solo_doc/domain/domain.dart';

import '../../../../constants/entities/entities.dart';
import '../../../../fixtures/p2p_purpose_session_stack_mock_gen.mocks.dart';

void main() {
  late MockMGetSoloDocGetterStore mockGetterStore;
  late GetSoloDocStore getSoloDocStore;
  const tParams = GetSoloDocParams(getCollaboratorsDoc: true);

  setUp(() {
    mockGetterStore = MockMGetSoloDocGetterStore();
    getSoloDocStore = GetSoloDocStore(
      getterStore: mockGetterStore,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      getSoloDocStore.stateOrErrorUpdater(
        ConstantSoloDocContentEntity.wrappedSuccessCase,
      );
      expect(
        getSoloDocStore.docContent,
        "content",
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      getSoloDocStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(getSoloDocStore.docContent, "");
      expect(getSoloDocStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async => ConstantSoloDocContentEntity.wrappedNotSuccessCase,
      );
      await getSoloDocStore(tParams);
      expect(
        getSoloDocStore.docContent,
        "",
      );
      expect(getSoloDocStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await getSoloDocStore(tParams);
      expect(getSoloDocStore.docContent, "");
      expect(getSoloDocStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
}
