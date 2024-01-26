import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';

import '../../constants/entities/entities.dart';
import '../../fixtures/solo_doc_mock_gen.mocks.dart';

void main() {
  late MockMSoloDocContract mockContract;
  late CreateSoloDoc logic;
  const tParams = CreateSoloDocParams(docType: 'purpose');

  setUp(() {
    mockContract = MockMSoloDocContract();
    logic = CreateSoloDoc(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.createSoloDoc(docType: tParams.docType)).thenAnswer(
      (_) async => ConstantSoloDocCreationStatusEntity.wrappedSuccessCase,
    );

    final result = await logic(tParams);

    expect(result, ConstantSoloDocCreationStatusEntity.wrappedSuccessCase);
    verify(mockContract.createSoloDoc(docType: tParams.docType));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.createSoloDoc(docType: tParams.docType)).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(tParams);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.createSoloDoc(docType: tParams.docType));
    verifyNoMoreInteractions(mockContract);
  });
}
