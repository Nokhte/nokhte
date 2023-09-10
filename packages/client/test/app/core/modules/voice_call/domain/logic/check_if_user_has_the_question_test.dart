// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/voice_call/domain/domain.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/voice_call_mock_gen.mocks.dart';

void main() {
  late MockMVoiceCallContract mockContract;
  late CheckIfUserHasTheQuestion logic;
  final tParams = NoParams();

  setUp(() {
    mockContract = MockMVoiceCallContract();
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
