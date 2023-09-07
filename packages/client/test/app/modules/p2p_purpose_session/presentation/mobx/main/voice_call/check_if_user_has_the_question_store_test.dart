// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';

import '../../../../constants/entities/entities.dart';
import '../../../../fixtures/p2p_purpose_session_stack_mock_gen.mocks.dart';

void main() {
  late MockMCheckIfUserHasTheQuestionGetterStore mockGetterStore;
  late CheckIfUserHasTheQuestionStore checkIfUserHasTheQuestionStore;
  final tParams = NoParams();

  setUp(() {
    mockGetterStore = MockMCheckIfUserHasTheQuestionGetterStore();
    checkIfUserHasTheQuestionStore = CheckIfUserHasTheQuestionStore(
      getterStore: mockGetterStore,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      checkIfUserHasTheQuestionStore.stateOrErrorUpdater(
        ConstantWhoGetsTheQuestionEntity.wrappedHasItCase,
      );
      expect(
        checkIfUserHasTheQuestionStore.hasTheQuestion,
        true,
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      checkIfUserHasTheQuestionStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(checkIfUserHasTheQuestionStore.hasTheQuestion, false);
      expect(checkIfUserHasTheQuestionStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore()).thenAnswer(
        (_) async => ConstantWhoGetsTheQuestionEntity.wrappedDoesNotHaveItCase,
      );
      await checkIfUserHasTheQuestionStore(tParams);
      expect(
        checkIfUserHasTheQuestionStore.hasTheQuestion,
        false,
      );
      expect(checkIfUserHasTheQuestionStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore()).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await checkIfUserHasTheQuestionStore(tParams);
      expect(checkIfUserHasTheQuestionStore.hasTheQuestion, false);
      expect(checkIfUserHasTheQuestionStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });
}
