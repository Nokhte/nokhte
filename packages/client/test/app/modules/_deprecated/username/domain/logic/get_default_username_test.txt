// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/username/domain/entities/default_username_entity.dart';
import 'package:primala/app/modules/username/domain/logic/get_default_username.dart';
import '../../fixtures/username_stack_mock_gen.mocks.dart';

void main() {
  late MockMUsernameContract mockUsernameContract;
  late GetDefaultUsername defaultUsernameLogic;
  const DefaultUsernameEntity tDefaultUsernameEntity =
      DefaultUsernameEntity(defaultUsername: "tester1");
  final DatabaseFailure dbFailure = FailureConstants.dbFailure;

  setUp(() {
    mockUsernameContract = MockMUsernameContract();
    defaultUsernameLogic = GetDefaultUsername(contract: mockUsernameContract);
  });

  test("✅ should pass the DefaultUsernameEntity from Contract to to the Logic",
      () async {
    when(mockUsernameContract.getDefaultUsername())
        .thenAnswer((_) async => const Right(tDefaultUsernameEntity));

    // act
    final result = await defaultUsernameLogic(NoParams());
    //assert
    expect(result, const Right(tDefaultUsernameEntity));
    verify(mockUsernameContract.getDefaultUsername());
    verifyNoMoreInteractions(mockUsernameContract);
  });

  test("✅ should pass the failure in the same way w/ no issues", () async {
    //arrange
    when(mockUsernameContract.getDefaultUsername())
        .thenAnswer((_) async => Left(dbFailure));
    // act
    final result = await defaultUsernameLogic(NoParams());
    //assert
    expect(result, Left(dbFailure));
    verify(mockUsernameContract.getDefaultUsername());
    verifyNoMoreInteractions(mockUsernameContract);
  });
}
