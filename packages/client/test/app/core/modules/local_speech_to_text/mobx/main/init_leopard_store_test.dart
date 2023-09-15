import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/local_speech_to_text/mobx/mobx.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/local_speech_to_text_mock_gen.mocks.dart';

void main() {
  late MockMInitLeopardGetterStore mockGetterStore;
  late InitLeopardStore mainStore;
  final tParams = NoParams();

  setUp(() {
    mockGetterStore = MockMInitLeopardGetterStore();
    mainStore = InitLeopardStore(
      getterStore: mockGetterStore,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      mainStore.stateOrErrorUpdater(
        ConstantInitLeopardStatusEntity.wrappedSuccessCase,
      );
      expect(
        mainStore.isInitialized,
        true,
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      mainStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(mainStore.isInitialized, false);
      expect(mainStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async => ConstantInitLeopardStatusEntity.wrappedNotSuccessCase,
      );
      await mainStore(tParams);
      expect(
        mainStore.isInitialized,
        false,
      );
      expect(mainStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await mainStore(tParams);
      expect(mainStore.isInitialized, false);
      expect(mainStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
}
