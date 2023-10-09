import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/gyroscopic/domain/domain.dart';
import 'package:primala/app/core/modules/gyroscopic/domain/logic/get_direction_angle.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/gyroscopic_mock_gen.mocks.dart';

void main() {
  late MockMGyroscopicContract mockContract;
  late GetDirectionAngle logic;
  final tParams = NoParams();

  setUp(() {
    mockContract = MockMGyroscopicContract();
    logic = GetDirectionAngle(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.getDirectionAngle(tParams)).thenAnswer(
      (_) async => ConstantDirectionAngleEntity.wrappedSuccessCase,
    );

    final result = await logic(tParams);
    result.fold((failure) {}, (entity) {
      entity.angleStream.listen((value) {
        expect(value, 95);
      });
    });
    verify(mockContract.getDirectionAngle(tParams));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.getDirectionAngle(tParams)).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(tParams);

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.getDirectionAngle(tParams));
    verifyNoMoreInteractions(mockContract);
  });
}
