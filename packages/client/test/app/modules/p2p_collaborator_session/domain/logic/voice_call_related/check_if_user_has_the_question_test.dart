// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/logic/logic.dart';
import '../../../constants/entities/entities.dart';
import '../../../fixtures/p2p_purpose_session_stack_mock_gen.mocks.dart';

void main() {
  late MockMP2PPurposeSessionVoiceCallContract mockContract;
  late CheckIfUserHasTheQuestion logic;
  final tParams = NoParams();

  setUp(() {
    mockContract = MockMP2PPurposeSessionVoiceCallContract();
    logic = CheckIfUserHasTheQuestion(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.checkIfUserHasTheQuestion()).thenAnswer(
      (_) async => ConstantWhoGetsTheQuestionEntity.wrappedHasItCase,
    );

    final result = await logic(tParams);

    expect(result, ConstantWhoGetsTheQuestionEntity.wrappedHasItCase);
    verify(mockContract.checkIfUserHasTheQuestion());
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.checkIfUserHasTheQuestion()).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(tParams);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.checkIfUserHasTheQuestion());
    verifyNoMoreInteractions(mockContract);
  });
}
