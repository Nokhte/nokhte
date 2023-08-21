// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/logic/logic.dart';

import '../../constants/entities/entities.dart';
import '../../fixtures/p2p_collaborator_pool_stack_mock_gen.mocks.dart';

void main() {
  late MockMockMP2PCollaboratorPoolContract mockContract;
  late OnSpeechResult logic;

  setUp(() {
    mockContract = MockMockMP2PCollaboratorPoolContract();
    logic = OnSpeechResult(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.onSpeechResult()).thenAnswer(
      (_) async => ConstantSpeechToTextResultEntity.wrappedSuccessCase,
    );

    final result = await logic(NoParams());

    expect(result, ConstantSpeechToTextResultEntity.wrappedSuccessCase);
    verify(mockContract.onSpeechResult());
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.onSpeechResult()).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(NoParams());

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.onSpeechResult());
    verifyNoMoreInteractions(mockContract);
  });
}
