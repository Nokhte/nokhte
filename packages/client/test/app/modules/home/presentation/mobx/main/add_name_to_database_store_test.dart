import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/main/add_name_to_database_store.dart';

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
        const Right(true),
      );
      expect(
        addNameToDatabaseStore.nameIsAdded,
        true,
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      addNameToDatabaseStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(addNameToDatabaseStore.nameIsAdded, false);
      expect(addNameToDatabaseStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore(NoParams())).thenAnswer(
        (_) async => const Right(true),
      );
      await addNameToDatabaseStore(NoParams());
      expect(addNameToDatabaseStore.nameIsAdded, true);
      expect(addNameToDatabaseStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore(NoParams())).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await addNameToDatabaseStore(NoParams());
      expect(addNameToDatabaseStore.nameIsAdded, false);
      expect(addNameToDatabaseStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });
}
