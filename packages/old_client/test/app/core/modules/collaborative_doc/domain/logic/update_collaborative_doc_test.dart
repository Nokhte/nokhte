import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/collaborative_doc_mock_gen.mocks.dart';

void main() {
  late MockMCollaborativeDocContract mockContract;
  late UpdateCollaborativeDoc logic;
  const tParams = UpdateCollaborativeDocParams(
    newContent: 'newContent',
  );

  setUp(() {
    mockContract = MockMCollaborativeDocContract();
    logic = UpdateCollaborativeDoc(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.updateCollaborativeDoc(newContent: tParams.newContent))
        .thenAnswer(
      (_) async =>
          ConstantCollaborativeDocUpdateStatusEntity.wrappedSuccessCase,
    );
    final result = await logic(tParams);

    expect(
        result, ConstantCollaborativeDocUpdateStatusEntity.wrappedSuccessCase);

    verify(mockContract.updateCollaborativeDoc(newContent: tParams.newContent));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.updateCollaborativeDoc(newContent: tParams.newContent))
        .thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(tParams);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.updateCollaborativeDoc(
      newContent: tParams.newContent,
    ));
    verifyNoMoreInteractions(mockContract);
  });
}
