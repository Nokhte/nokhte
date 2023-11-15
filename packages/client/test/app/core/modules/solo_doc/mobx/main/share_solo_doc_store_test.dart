import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/solo_doc/mobx/mobx.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/solo_doc_mock_gen.mocks.dart';

void main() {
  late MockMShareSoloDocGetterStore mockGetterStore;
  late ShareSoloDocStore shareSoloDocStore;
  final tParams = NoParams();

  setUp(() {
    mockGetterStore = MockMShareSoloDocGetterStore();
    shareSoloDocStore = ShareSoloDocStore(
      getterStore: mockGetterStore,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      shareSoloDocStore.stateOrErrorUpdater(
        ConstantSoloDocSharingStatusEntity.wrappedSuccessCase,
      );
      expect(
        shareSoloDocStore.isShared,
        true,
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      shareSoloDocStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(shareSoloDocStore.isShared, false);
      expect(
          shareSoloDocStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async => ConstantSoloDocSharingStatusEntity.wrappedNotSuccessCase,
      );
      await shareSoloDocStore(tParams);
      expect(
        shareSoloDocStore.isShared,
        false,
      );
      expect(shareSoloDocStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await shareSoloDocStore(tParams);
      expect(shareSoloDocStore.isShared, false);
      expect(
          shareSoloDocStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
}
