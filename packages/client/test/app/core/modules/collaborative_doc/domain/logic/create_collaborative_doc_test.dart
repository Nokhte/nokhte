// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/collaborative_doc_mock_gen.mocks.dart';

void main() {
  late MockMCollaborativeDocContract mockContract;
  late CreateCollaborativeDoc logic;
  const tParams = CreateCollaborativeDocParams(docType: 'purpose');

  setUp(() {
    mockContract = MockMCollaborativeDocContract();
    logic = CreateCollaborativeDoc(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.createCollaborativeDoc(docType: 'purpose')).thenAnswer(
      (_) async =>
          ConstantCollaborativeDocCreationStatusEntity.wrappedSuccessCase,
    );

    final result = await logic(tParams);
    result.fold((failure) {}, (entity) {
      expect(entity.isSent, true);
    });

    expect(
        result,
        const TypeMatcher<
            Right<Failure, CollaborativeDocCreationStatusEntity>>());
    verify(mockContract.createCollaborativeDoc(docType: 'purpose'));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.createCollaborativeDoc(docType: 'purpose')).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(tParams);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.createCollaborativeDoc(docType: 'purpose'));
    verifyNoMoreInteractions(mockContract);
  });
}
