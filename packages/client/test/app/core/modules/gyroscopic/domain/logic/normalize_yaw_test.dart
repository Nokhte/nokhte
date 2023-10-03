import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/modules/gyroscopic/domain/domain.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/gyroscopic_mock_gen.mocks.dart';

void main() {
  late MockMGyroscopicContract mockContract;
  late NormalizeYaw logic;
  const tParams = FetchRawDirectionsParams(
    gyroData: 0.9,
    accelerometerPitch: 0.9,
    accelerometerRoll: 0.9,
    dt: 1,
  );

  setUp(() {
    mockContract = MockMGyroscopicContract();
    logic = NormalizeYaw(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.fetchRawDirections(tParams)).thenAnswer(
      (_) async => ConstantGyroscopeDirectionsEntity.wrappedSuccessCase,
    );

    final result = await logic(tParams);

    expect(result, ConstantNormalizedYawEntity.wrappedSuccessCase);
    verify(mockContract.fetchRawDirections(tParams));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.fetchRawDirections(tParams)).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(tParams);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.fetchRawDirections(tParams));
    verifyNoMoreInteractions(mockContract);
  });
}
