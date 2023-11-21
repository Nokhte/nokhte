import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/voice_call_mock_gen.mocks.dart';

void main() {
  late MockMGetChannelIdGetterStore mockGetterStore;
  late GetChannelIdStore getChannelIdStore;
  final tParams = NoParams();

  setUp(() {
    mockGetterStore = MockMGetChannelIdGetterStore();
    getChannelIdStore = GetChannelIdStore(
      getterStore: mockGetterStore,
    );
  });

  group("stateOrErrorUpdater", () {
    test("✅ Success Case: should update accordingly if state is passed", () {
      getChannelIdStore.stateOrErrorUpdater(
        ConstantChannelIdEntity.wrappedSuccessCase,
      );
      expect(
        getChannelIdStore.channelId,
        'someChannelId',
      );
    });
    test("❌ Success Case: should update accordingly if failure is passed", () {
      getChannelIdStore.stateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(getChannelIdStore.channelId, "");
      expect(
          getChannelIdStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
  group("call", () {
    test("✅ Success Case: should update accordingly if state is passed",
        () async {
      when(mockGetterStore()).thenAnswer(
        (_) async => ConstantChannelIdEntity.wrappedNotSuccessCase,
      );
      await getChannelIdStore(tParams);
      expect(
        getChannelIdStore.channelId,
        "",
      );
      expect(getChannelIdStore.errorMessage, "");
    });
    test("❌ Success Case: should update accordingly if failure is passed",
        () async {
      when(mockGetterStore()).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await getChannelIdStore(tParams);
      expect(getChannelIdStore.channelId, "");
      expect(
          getChannelIdStore.errorMessage, FailureConstants.genericFailureMsg);
    });
  });
}
