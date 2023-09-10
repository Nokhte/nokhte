// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/voice_call/mobx/mobx.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/voice_call_mock_gen.mocks.dart';

void main() {
  late MockMFetchChannelIdGetterStore mockGetterStore;
  late FetchChannelIdStore fetchChannelIdStore;
  final tParams = NoParams();

  setUp(() {
    mockGetterStore = MockMFetchChannelIdGetterStore();
    fetchChannelIdStore = FetchChannelIdStore(
      getterStore: mockGetterStore,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      fetchChannelIdStore.stateOrErrorUpdater(
        ConstantChannelIdEntity.wrappedSuccessCase,
      );
      expect(
        fetchChannelIdStore.channelId,
        'someChannelId',
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      fetchChannelIdStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(fetchChannelIdStore.channelId, "");
      expect(
          fetchChannelIdStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore()).thenAnswer(
        (_) async => ConstantChannelIdEntity.wrappedNotSuccessCase,
      );
      await fetchChannelIdStore(tParams);
      expect(
        fetchChannelIdStore.channelId,
        "",
      );
      expect(fetchChannelIdStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore()).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await fetchChannelIdStore(tParams);
      expect(fetchChannelIdStore.channelId, "");
      expect(
          fetchChannelIdStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
}
