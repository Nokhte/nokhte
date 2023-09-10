// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:primala/app/core/modules/collaborative_doc/mobx/mobx.dart';
import 'package:primala/app/core/modules/voice_call/mobx/mobx.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/collaborative_doc_mock_gen.mocks.dart';

void main() {
  late MockMCreateCollaborativeDocGetterStore mockGetterStore;
  late CreateCollaborativeDocStore fetchChannelIdStore;
  const tParams = CreateCollaborativeDocParams(docType: 'purpose');

  setUp(() {
    mockGetterStore = MockMCreateCollaborativeDocGetterStore();
    fetchChannelIdStore = CreateCollaborativeDocStore(
      getterStore: mockGetterStore,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      fetchChannelIdStore.stateOrErrorUpdater(
        ConstantCollaborativeDocCreationStatusEntity.wrappedSuccessCase,
      );
      expect(
        fetchChannelIdStore.isCreated,
        true,
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      fetchChannelIdStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(fetchChannelIdStore.isCreated, false);
      expect(
          fetchChannelIdStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async =>
            ConstantCollaborativeDocCreationStatusEntity.wrappedNotSuccessCase,
      );
      await fetchChannelIdStore(tParams);
      expect(
        fetchChannelIdStore.isCreated,
        false,
      );
      expect(fetchChannelIdStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await fetchChannelIdStore(tParams);
      expect(fetchChannelIdStore.isCreated, false);
      expect(
          fetchChannelIdStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
}
