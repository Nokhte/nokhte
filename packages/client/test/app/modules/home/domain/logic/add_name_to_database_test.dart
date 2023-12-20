import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/home/domain/logic/add_name_to_database.dart';

import '../../constants/entities/entities.dart';
import '../../fixtures/home_stack_mock_gen.mocks.dart';

void main() {
  late MockHomeContract mockContract;
  late AddNameToDatabase logic;

  setUp(() {
    mockContract = MockHomeContract();
    logic = AddNameToDatabase(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.addNameToDatabase(NoParams())).thenAnswer(
      (_) async => ConstantNameCreationStatusEntities.wrappedSuccessCase,
    );

    final result = await logic(NoParams());

    expect(result, ConstantNameCreationStatusEntities.wrappedSuccessCase);
    verify(mockContract.addNameToDatabase(NoParams()));
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.addNameToDatabase(NoParams())).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(NoParams());

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.addNameToDatabase(NoParams()));
    verifyNoMoreInteractions(mockContract);
  });
}
