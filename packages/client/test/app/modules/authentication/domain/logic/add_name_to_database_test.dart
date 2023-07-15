// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/authentication/domain/logic/add_name_to_database.dart';

import '../../constants/entities.dart';
import '../../fixtures/authentication_stack_mock_gen.mocks.dart';

void main() {
  late MockMAuthenticationContract mockContract;
  late AddNameToDatabase logic;

  setUp(() {
    mockContract = MockMAuthenticationContract();
    logic = AddNameToDatabase(contract: mockContract);
  });

  test("✅ should pass the Status Entity from Contract ==> Logic", () async {
    when(mockContract.addNameToDatabase()).thenAnswer(
      (_) async => ConstantNameCreationStatusEntities.wrappedSuccessCase,
    );

    final result = await logic(NoParams());

    expect(result, ConstantNameCreationStatusEntities.wrappedSuccessCase);
    verify(mockContract.addNameToDatabase());
    verifyNoMoreInteractions(mockContract);
  });

  test("✅ should pass A Failure from Contract ==> Logic", () async {
    when(mockContract.addNameToDatabase()).thenAnswer(
      (_) async => Left(FailureConstants.dbFailure),
    );

    final result = await logic(NoParams());

    expect(result, Left(FailureConstants.dbFailure));
    verify(mockContract.addNameToDatabase());
    verifyNoMoreInteractions(mockContract);
  });
}
