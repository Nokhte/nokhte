import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/modules/solo_doc/mobx/mobx.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/solo_doc_mock_gen.mocks.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';

void main() {
  late MockMSubmitSoloDocGetterStore mockGetterStore;
  late SubmitSoloDocStore submitSoloDocStore;
  const tParams = SubmitSoloDocParams(content: "content");

  setUp(() {
    mockGetterStore = MockMSubmitSoloDocGetterStore();
    submitSoloDocStore = SubmitSoloDocStore(
      getterStore: mockGetterStore,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      submitSoloDocStore.stateOrErrorUpdater(
        ConstantSoloDocSubmissionStatusEntity.wrappedSuccessCase,
      );
      expect(
        submitSoloDocStore.isSubmitted,
        true,
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      submitSoloDocStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(submitSoloDocStore.isSubmitted, false);
      expect(
          submitSoloDocStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async =>
            ConstantSoloDocSubmissionStatusEntity.wrappedNotSuccessCase,
      );
      await submitSoloDocStore(tParams);
      expect(
        submitSoloDocStore.isSubmitted,
        false,
      );
      expect(submitSoloDocStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await submitSoloDocStore(tParams);
      expect(submitSoloDocStore.isSubmitted, false);
      expect(
        submitSoloDocStore.errorMessage,
        FailureConstants.genericFailureMsg,
      );
    });
  });
}
