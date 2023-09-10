// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/modules/solo_doc/domain/domain.dart';
import '../../../constants/entities/entities.dart';
import '../../../fixtures/p2p_purpose_session_stack_mock_gen.mocks.dart';

void main() {
  late MockMP2PPurposeSessionSoloDocContract mockContract;
  late SubmitSoloDoc logic;
  const tParams = SubmitSoloDocParams(content: "content");

  setUp(() {
    mockContract = MockMP2PPurposeSessionSoloDocContract();
    logic = SubmitSoloDoc(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.submitDocContent(newContent: tParams.content)).thenAnswer(
      (_) async => ConstantSoloDocSubmissionStatusEntity.wrappedSuccessCase,
    );

    final result = await logic(tParams);

    expect(result, ConstantSoloDocSubmissionStatusEntity.wrappedSuccessCase);
    verify(mockContract.submitDocContent(newContent: tParams.content));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.submitDocContent(newContent: tParams.content)).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(tParams);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.submitDocContent(newContent: tParams.content));
    verifyNoMoreInteractions(mockContract);
  });
}
