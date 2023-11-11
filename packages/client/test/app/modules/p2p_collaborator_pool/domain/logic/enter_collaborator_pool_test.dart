import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/logic/logic.dart';
import 'package:nokhte_backend/phrase_components.dart';

import '../../constants/entities/entities.dart';
import '../../fixtures/p2p_collaborator_pool_stack_mock_gen.mocks.dart';

void main() {
  late MockMP2PCollaboratorPoolContract mockContract;
  late EnterCollaboratorPool logic;
  const CollaboratorPhraseIDs phraseIds =
      CollaboratorPhraseIDs(adjectiveID: 1, nounID: 1);

  setUp(() {
    mockContract = MockMP2PCollaboratorPoolContract();
    logic = EnterCollaboratorPool(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.enterTheCollaboratorPool(phraseIDs: phraseIds))
        .thenAnswer(
      (_) async => ConstantCollaboratorPoolEntryStatusEntity.wrappedSuccessCase,
    );

    final result = await logic(phraseIds);

    expect(
        result, ConstantCollaboratorPoolEntryStatusEntity.wrappedSuccessCase);
    verify(mockContract.enterTheCollaboratorPool(phraseIDs: phraseIds));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.enterTheCollaboratorPool(phraseIDs: phraseIds))
        .thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(phraseIds);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.enterTheCollaboratorPool(phraseIDs: phraseIds));
    verifyNoMoreInteractions(mockContract);
  });
}
