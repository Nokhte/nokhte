import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/modules/solo_doc/mobx/mobx.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/solo_doc_mock_gen.mocks.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';

void main() {
  late MockMGetSoloDoc mockGetterStore;
  late GetSoloDocStore getSoloDocStore;
  const tParams = GetSoloDocParams(getCollaboratorsDoc: true);

  setUp(() {
    mockGetterStore = MockMGetSoloDoc();
    getSoloDocStore = GetSoloDocStore(
      logic: mockGetterStore,
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
