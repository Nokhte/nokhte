import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/home/domain/entities/entities.dart';
import 'package:nokhte/app/modules/home/domain/logic/logic.dart';
import '../../fixtures/home_stack_mock_gen.mocks.dart';

void main() {
  late MockHomeContract mockContract;
  late ShareCollaborationInvitation logic;
  const Either<Failure, CollaborationInvitationSendStatusEntity> tSuccess =
      Right(CollaborationInvitationSendStatusEntity(isSent: true));

  setUp(() {
    mockContract = MockHomeContract();
    logic = ShareCollaborationInvitation(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.shareCollaborationInvitation(''))
        .thenAnswer((_) async => tSuccess);

    final result = await logic('');

    expect(result, tSuccess);
    verify(mockContract.shareCollaborationInvitation(''));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.shareCollaborationInvitation('')).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic('');

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.shareCollaborationInvitation(''));
    verifyNoMoreInteractions(mockContract);
  });
}
