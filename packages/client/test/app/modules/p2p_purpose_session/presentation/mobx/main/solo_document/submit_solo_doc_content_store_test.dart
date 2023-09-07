// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';

import '../../../../constants/entities/entities.dart';
import '../../../../fixtures/p2p_purpose_session_stack_mock_gen.mocks.dart';

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
