// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/home/domain/logic/logic.dart';

import '../../constants/entities/entities.dart';
import '../../fixtures/home_stack_mock_gen.mocks.dart';

void main() {
  late MockMHomeContract mockContract;
  late GetCollaboratorPhrase logic;

  setUp(() {
    mockContract = MockMHomeContract();
    logic = GetCollaboratorPhrase(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.getCollaboratorPhrase()).thenAnswer(
      (_) async => ConstantCollaboratorPhraseEntities.wrappedSuccessCase,
    );

    final result = await logic(NoParams());

    expect(result, ConstantCollaboratorPhraseEntities.wrappedSuccessCase);
    verify(mockContract.getCollaboratorPhrase());
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.getCollaboratorPhrase()).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(NoParams());

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.getCollaboratorPhrase());
    verifyNoMoreInteractions(mockContract);
  });
}
