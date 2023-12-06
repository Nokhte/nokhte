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
  late CancelCollaboratorStream logic;

  setUp(() {
    mockContract = MockMP2PCollaboratorPoolContract();
    logic = CancelCollaboratorStream(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.cancelCollaboratorStream()).thenAnswer(
      (_) async => ConstantCollaboratorStreamStatusEntity.wrappedSuccessCase,
    );

    final result = await logic(NoParams());

    expect(result, ConstantCollaboratorStreamStatusEntity.wrappedSuccessCase);
    verify(mockContract.cancelCollaboratorStream());
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.cancelCollaboratorStream()).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(NoParams());

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.cancelCollaboratorStream());
    verifyNoMoreInteractions(mockContract);
  });
}
