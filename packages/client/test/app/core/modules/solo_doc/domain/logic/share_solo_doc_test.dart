import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/solo_doc_mock_gen.mocks.dart';

void main() {
  late MockMSoloDocContract mockContract;
  late ShareSoloDoc logic;
  final tParams = NoParams();

  setUp(() {
    mockContract = MockMSoloDocContract();
    logic = ShareSoloDoc(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.shareSoloDoc()).thenAnswer(
      (_) async => ConstantSoloDocSharingStatusEntity.wrappedSuccessCase,
    );

    final result = await logic(tParams);

    expect(result, ConstantSoloDocSharingStatusEntity.wrappedSuccessCase);
    verify(mockContract.shareSoloDoc());
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.shareSoloDoc()).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(tParams);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.shareSoloDoc());
    verifyNoMoreInteractions(mockContract);
  });
}
