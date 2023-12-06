import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/collaborative_doc_mock_gen.mocks.dart';

void main() {
  late MockMCollaborativeDocContract mockContract;
  late UpdateUserPresence logic;
  const tParams = UpdateUserPresenceParams(newPresence: true);

  setUp(() {
    mockContract = MockMCollaborativeDocContract();
    logic = UpdateUserPresence(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.updateUserPresence(newPresence: true)).thenAnswer(
      (_) async => ConstantCollaborativeDocPresenceUpdaterStatusEntity
          .wrappedSuccessCase,
    );

    final result = await logic(tParams);

    expect(result,
        ConstantCollaborativeDocPresenceUpdaterStatusEntity.wrappedSuccessCase);
    verify(mockContract.updateUserPresence(newPresence: true));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.updateUserPresence(newPresence: true)).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(tParams);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.updateUserPresence(newPresence: true));
    verifyNoMoreInteractions(mockContract);
  });
}
