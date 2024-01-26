import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/voice_call_mock_gen.mocks.dart';

void main() {
  late MockMGetAgoraToken mockLogic;
  late GetAgoraTokenStore getAgoraTokenStore;
  const tParams = GetAgoraTokenParams(channelName: 'hi');

  setUp(() {
    mockLogic = MockMGetAgoraToken();
    getAgoraTokenStore = GetAgoraTokenStore(
      logic: mockLogic,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      getAgoraTokenStore.stateOrErrorUpdater(
        ConstantAgoraCallTokenEntity.wrappedSuccessCase,
      );
      expect(
        getAgoraTokenStore.token,
        'someReturnedToken',
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      getAgoraTokenStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(getAgoraTokenStore.token, "");
      expect(
          getAgoraTokenStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockLogic(tParams)).thenAnswer(
        (_) async => ConstantAgoraCallTokenEntity.wrappedNotSuccessCase,
      );
      await getAgoraTokenStore(tParams);
      expect(
        getAgoraTokenStore.token,
        "",
      );
      expect(getAgoraTokenStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockLogic(tParams)).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await getAgoraTokenStore(tParams);
      expect(getAgoraTokenStore.token, "");
      expect(
          getAgoraTokenStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
}
