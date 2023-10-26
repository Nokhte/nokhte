// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/presentation/presentation.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/collaborative_doc_mock_gen.mocks.dart';

void main() {
  late MockMUpdateCollaborativeDocGetterStore mockGetterStore;
  late UpdateCollaborativeDocStore fetchChannelIdStore;
  const tParams = UpdateCollaborativeDocParams(newContent: 'newContent');

  setUp(() {
    mockGetterStore = MockMUpdateCollaborativeDocGetterStore();
    fetchChannelIdStore = UpdateCollaborativeDocStore(
      getterStore: mockGetterStore,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      fetchChannelIdStore.stateOrErrorUpdater(
        ConstantCollaborativeDocUpdateStatusEntity.wrappedSuccessCase,
      );
      expect(
        fetchChannelIdStore.isUpdated,
        true,
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      fetchChannelIdStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(fetchChannelIdStore.isUpdated, false);
      expect(
          fetchChannelIdStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async =>
            ConstantCollaborativeDocUpdateStatusEntity.wrappedNotSuccessCase,
      );
      await fetchChannelIdStore(tParams);
      expect(
        fetchChannelIdStore.isUpdated,
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
      expect(fetchChannelIdStore.isUpdated, false);
      expect(
          fetchChannelIdStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
}
