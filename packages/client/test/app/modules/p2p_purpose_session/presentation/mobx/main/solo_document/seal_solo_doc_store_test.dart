// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';

import '../../../../constants/entities/entities.dart';
import '../../../../fixtures/p2p_purpose_session_stack_mock_gen.mocks.dart';

void main() {
  late MockMSealSoloDocGetterStore mockGetterStore;
  late SealSoloDocStore sealSoloDocStore;
  final tParams = NoParams();

  setUp(() {
    mockGetterStore = MockMSealSoloDocGetterStore();
    sealSoloDocStore = SealSoloDocStore(
      getterStore: mockGetterStore,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      sealSoloDocStore.stateOrErrorUpdater(
        ConstantSoloDocSealingStatusEntity.wrappedSuccessCase,
      );
      expect(
        sealSoloDocStore.isSealed,
        true,
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      sealSoloDocStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(sealSoloDocStore.isSealed, false);
      expect(sealSoloDocStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async => ConstantSoloDocSealingStatusEntity.wrappedNotSuccessCase,
      );
      await sealSoloDocStore(tParams);
      expect(
        sealSoloDocStore.isSealed,
        false,
      );
      expect(sealSoloDocStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await sealSoloDocStore(tParams);
      expect(sealSoloDocStore.isSealed, false);
      expect(sealSoloDocStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
}
