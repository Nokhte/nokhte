// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/logic/logic.dart';

import '../../constants/entities/entities.dart';
import '../../fixtures/p2p_collaborator_pool_stack_mock_gen.mocks.dart';

void main() {
  late MockMP2PCollaboratorPoolContract mockContract;
  late ValidateQuery logic;

  setUp(() {
    mockContract = MockMP2PCollaboratorPoolContract();
    logic = ValidateQuery(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.validateQuery("aromatic acid")).thenAnswer(
      (_) async =>
          ConstantCollaboratorPhraseValidationEntity.wrappedSuccessCase,
    );

    final result =
        await logic(const ValidateQueryParams(query: "aromatic acid"));

    expect(
        result, ConstantCollaboratorPhraseValidationEntity.wrappedSuccessCase);
    verify(mockContract.validateQuery("aromatic acid"));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.validateQuery("aromatic acid")).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result =
        await logic(const ValidateQueryParams(query: "aromatic acid"));

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.validateQuery("aromatic acid"));
    verifyNoMoreInteractions(mockContract);
  });
}
