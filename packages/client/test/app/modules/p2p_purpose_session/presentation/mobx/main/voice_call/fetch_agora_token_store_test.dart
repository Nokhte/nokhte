// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/modules/voice_call/domain/domain.dart';
import 'package:primala/app/core/modules/voice_call/mobx/mobx.dart';
import '../../../../constants/entities/entities.dart';
import '../../../../fixtures/p2p_purpose_session_stack_mock_gen.mocks.dart';

void main() {
  late MockMFetchAgoraTokenGetterStore mockGetterStore;
  late FetchAgoraTokenStore fetchAgoraTokenStore;
  const tParams = FetchAgoraTokenParams(channelName: 'hi');

  setUp(() {
    mockGetterStore = MockMFetchAgoraTokenGetterStore();
    fetchAgoraTokenStore = FetchAgoraTokenStore(
      getterStore: mockGetterStore,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      fetchAgoraTokenStore.stateOrErrorUpdater(
        ConstantAgoraCallTokenEntity.wrappedSuccessCase,
      );
      expect(
        fetchAgoraTokenStore.token,
        'someReturnedToken',
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      fetchAgoraTokenStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(fetchAgoraTokenStore.token, "");
      expect(fetchAgoraTokenStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async => ConstantAgoraCallTokenEntity.wrappedNotSuccessCase,
      );
      await fetchAgoraTokenStore(tParams);
      expect(
        fetchAgoraTokenStore.token,
        "",
      );
      expect(fetchAgoraTokenStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore(tParams)).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await fetchAgoraTokenStore(tParams);
      expect(fetchAgoraTokenStore.token, "");
      expect(fetchAgoraTokenStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });
}
