// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/collaborative_doc_mock_gen.mocks.dart';

void main() {
  late MockMCollaborativeDocContract mockContract;
  late UpdateUserDelta logic;
  const tParams = UpdateUserDeltaParams(newDelta: 1);

  setUp(() {
    mockContract = MockMCollaborativeDocContract();
    logic = UpdateUserDelta(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.updateUserDelta(newDelta: 1)).thenAnswer(
      (_) async =>
          ConstantCollaborativeDocDeltaUpdaterStatusEntity.wrappedSuccessCase,
    );

    final result = await logic(tParams);

    expect(result,
        ConstantCollaborativeDocDeltaUpdaterStatusEntity.wrappedSuccessCase);
    verify(mockContract.updateUserDelta(newDelta: 1));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.updateUserDelta(newDelta: 1)).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(tParams);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.updateUserDelta(newDelta: 1));
    verifyNoMoreInteractions(mockContract);
  });
}
