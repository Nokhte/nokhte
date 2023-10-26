// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/logic/logic.dart';

import '../../constants/entities/entities.dart';
import '../../fixtures/p2p_collaborator_pool_stack_mock_gen.mocks.dart';

void main() {
  late MockMP2PCollaboratorPoolContract mockContract;
  late ExitCollaboratorPool logic;

  setUp(() {
    mockContract = MockMP2PCollaboratorPoolContract();
    logic = ExitCollaboratorPool(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.exitCollaboratorPool()).thenAnswer(
      (_) async => ConstantCollaboratorPoolExitStatusEntity.wrappedSuccessCase,
    );

    final result = await logic(NoParams());

    expect(result, ConstantCollaboratorPoolExitStatusEntity.wrappedSuccessCase);
    verify(mockContract.exitCollaboratorPool());
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.exitCollaboratorPool()).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(NoParams());

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.exitCollaboratorPool());
    verifyNoMoreInteractions(mockContract);
  });
}
