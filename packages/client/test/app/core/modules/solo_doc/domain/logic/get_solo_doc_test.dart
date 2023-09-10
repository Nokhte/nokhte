// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/modules/solo_doc/domain/domain.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/solo_doc_mock_gen.mocks.dart';

void main() {
  late MockMSoloDocContract mockContract;
  late GetSoloDoc logic;
  const tParams = GetSoloDocParams(getCollaboratorsDoc: true);

  setUp(() {
    mockContract = MockMSoloDocContract();
    logic = GetSoloDoc(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.getSoloDocContent(
            getCollaboratorsDoc: tParams.getCollaboratorsDoc))
        .thenAnswer(
      (_) async => ConstantSoloDocContentEntity.wrappedSuccessCase,
    );

    final result = await logic(tParams);

    expect(result, ConstantSoloDocContentEntity.wrappedSuccessCase);
    verify(mockContract.getSoloDocContent(
        getCollaboratorsDoc: tParams.getCollaboratorsDoc));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.getSoloDocContent(
            getCollaboratorsDoc: tParams.getCollaboratorsDoc))
        .thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(tParams);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.getSoloDocContent(
        getCollaboratorsDoc: tParams.getCollaboratorsDoc));
    verifyNoMoreInteractions(mockContract);
  });
}
