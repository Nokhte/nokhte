// * Primala Domain Imports
import 'package:dartz/dartz.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/username/domain/entities/username_status_entity.dart';
import 'package:primala/app/modules/username/domain/logic/check_if_username_is_created.dart';
import 'package:primala/app/modules/username/domain/logic/create_username.dart';
// * Test-Specific Imports
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
// * Mock Import
import '../../fixtures/username_stack_mock_gen.mocks.dart';

void main() {
  late MockMUsernameContract mockUsernameContract;
  late CreateUsername createUsernameLogic;
  late CheckIfUsernameIsCreated checkIfUsernameIsCreatedLogic;
  const UsernameStatusEntity tUsernameEntity =
      UsernameStatusEntity(isCreated: true);
  final dbFailure = FailureConstants.dbFailure;

  setUp(() {
    mockUsernameContract = MockMUsernameContract();
  });

  group("CreateUsername", () {
    setUp(() {
      createUsernameLogic = CreateUsername(contract: mockUsernameContract);
    });
    test(
        "✅ should pass the Username Entity from the Contract to the Username Creation Logic",
        () async {
      // arrange
      when(mockUsernameContract.createUsername('tester1'))
          .thenAnswer((_) async => const Right(tUsernameEntity));
      //act
      final result = await createUsernameLogic(
          const CreateUserParams(username: 'tester1'));
      //assert
      expect(result, const Right(tUsernameEntity));
      verify(mockUsernameContract.createUsername('tester1'));
      verifyNoMoreInteractions(mockUsernameContract);
    });

    test("✅ should pass a failure the same as an Entity to the Logic",
        () async {
      //arrange
      when(mockUsernameContract.createUsername('tester1'))
          .thenAnswer((_) async => Left(dbFailure));
      //act
      final result = await createUsernameLogic(
          const CreateUserParams(username: 'tester1'));
      //assert
      expect(result, Left(dbFailure));
      verify(mockUsernameContract.createUsername('tester1'));
      verifyNoMoreInteractions(mockUsernameContract);
    });
  });

  group("CheckIfUsernameIsCreated", () {
    setUp(() {
      checkIfUsernameIsCreatedLogic =
          CheckIfUsernameIsCreated(contract: mockUsernameContract);
    });
    test(
        "✅ should pass the Username Entity from the Contract to the Username Creation Logic",
        () async {
      // arrange
      when(mockUsernameContract.checkIfUsernameIsCreated())
          .thenAnswer((_) async => const Right(tUsernameEntity));
      //act
      final result = await checkIfUsernameIsCreatedLogic(NoParams());
      //assert
      expect(result, const Right(tUsernameEntity));
      verify(mockUsernameContract.checkIfUsernameIsCreated());
      verifyNoMoreInteractions(mockUsernameContract);
    });

    test("✅ should pass a failure the same as an Entity to the Logic",
        () async {
      //arrange
      when(mockUsernameContract.checkIfUsernameIsCreated())
          .thenAnswer((_) async => Left(dbFailure));
      //act
      final result = await checkIfUsernameIsCreatedLogic(NoParams());
      //assert
      expect(result, Left(dbFailure));
      verify(mockUsernameContract.checkIfUsernameIsCreated());
      verifyNoMoreInteractions(mockUsernameContract);
    });
  });
}
