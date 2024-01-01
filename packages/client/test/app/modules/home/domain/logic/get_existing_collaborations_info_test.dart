import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/home/domain/entities/entities.dart';
import 'package:nokhte/app/modules/home/domain/logic/logic.dart';
import '../../fixtures/home_stack_mock_gen.mocks.dart';

void main() {
  late MockHomeContract mockContract;
  late GetExistingCollaborationsInfo logic;
  const Either<Failure, ExistingCollaborationsInfoEntity> tSuccess = Right(
    ExistingCollaborationsInfoEntity(
      hasACollaboration: true,
      hasAPurpose: true,
      hasDoneThePerspectivesSession: true,
    ),
  );

  setUp(() {
    mockContract = MockHomeContract();
    logic = GetExistingCollaborationsInfo(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.getExistingCollaborationInfo(NoParams()))
        .thenAnswer((_) async => tSuccess);

    final result = await logic(NoParams());

    expect(result, tSuccess);
    verify(mockContract.getExistingCollaborationInfo(NoParams()));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.getExistingCollaborationInfo(NoParams())).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(NoParams());

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.getExistingCollaborationInfo(NoParams()));
    verifyNoMoreInteractions(mockContract);
  });
}
