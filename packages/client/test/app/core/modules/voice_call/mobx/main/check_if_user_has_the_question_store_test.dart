import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/voice_call_mock_gen.mocks.dart';

void main() {
  late MockMCheckIfUserHasTheQuestion mockLogic;
  late CheckIfUserHasTheQuestionStore checkIfUserHasTheQuestionStore;
  final tParams = NoParams();

  setUp(() {
    mockLogic = MockMCheckIfUserHasTheQuestion();
    checkIfUserHasTheQuestionStore = CheckIfUserHasTheQuestionStore(
      logic: mockLogic,
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
      when(mockLogic(NoParams())).thenAnswer(
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
      when(mockLogic(NoParams())).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await checkIfUserHasTheQuestionStore(tParams);
      expect(checkIfUserHasTheQuestionStore.hasTheQuestion, false);
      expect(checkIfUserHasTheQuestionStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });
}
