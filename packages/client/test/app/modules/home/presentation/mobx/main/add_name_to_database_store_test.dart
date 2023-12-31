import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/main/add_name_to_database_store.dart';

import '../../../constants/entities/entities.dart';
import '../../../fixtures/home_stack_mock_gen.mocks.dart';

void main() {
  late MockAddNameToDatabase mockGetterStore;
  late AddNameToDatabaseStore addNameToDatabaseStore;

  setUp(() {
    mockGetterStore = MockAddNameToDatabase();
    addNameToDatabaseStore = AddNameToDatabaseStore(
      logic: mockGetterStore,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      addNameToDatabaseStore.stateOrErrorUpdater(
        ConstantNameCreationStatusEntities.wrappedSuccessCase,
      );
      expect(
        addNameToDatabaseStore.nameCreationStatus,
        ConstantNameCreationStatusEntities.successCase,
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      addNameToDatabaseStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(addNameToDatabaseStore.nameCreationStatus,
          ConstantNameCreationStatusEntities.notSuccessCase);
      expect(addNameToDatabaseStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore(NoParams())).thenAnswer(
        (_) async => ConstantNameCreationStatusEntities.wrappedSuccessCase,
      );
      await addNameToDatabaseStore(NoParams());
      expect(
        addNameToDatabaseStore.nameCreationStatus,
        ConstantNameCreationStatusEntities.successCase,
      );
      expect(addNameToDatabaseStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore(NoParams())).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await addNameToDatabaseStore(NoParams());
      expect(addNameToDatabaseStore.nameCreationStatus,
          ConstantNameCreationStatusEntities.notSuccessCase);
      expect(addNameToDatabaseStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });
}
