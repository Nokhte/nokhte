// * Testing & Mocking Libs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';

import '../../../../constants/entities/entities.dart';
import '../../../../fixtures/p2p_purpose_session_stack_mock_gen.mocks.dart';

void main() {
  late MockMJoinCallGetterStore mockJoinCallGetterStore;
  late MockMLeaveCallGetterStore mockLeaveCallGetterStore;
  late MockMMuteLocalAudioStreamGetterStore mockMuteLocalAudioStream;
  late MockMUnmuteLocalAudioStreamGetterStore mockUnmuteLocalAudioStream;
  late VoiceCallActionsStore checkIfUserHasTheQuestionStore;
  final tParams = NoParams();
  const joinCallParams = JoinCallParams(channelId: "channelId", token: "token");

  setUp(() {
    mockJoinCallGetterStore = MockMJoinCallGetterStore();
    mockLeaveCallGetterStore = MockMLeaveCallGetterStore();
    mockMuteLocalAudioStream = MockMMuteLocalAudioStreamGetterStore();
    mockUnmuteLocalAudioStream = MockMUnmuteLocalAudioStreamGetterStore();
    checkIfUserHasTheQuestionStore = VoiceCallActionsStore(
      joinCallGetterStore: mockJoinCallGetterStore,
      leaveCallGetterStore: mockLeaveCallGetterStore,
      muteAudioGetterStore: mockMuteLocalAudioStream,
      unmuteAudioGetterStore: mockUnmuteLocalAudioStream,
    );
  });

  group("audioStateOrErrorUpdater", () {
    test(
        "✅ Success Unmute Local Audio Case: should update accordingly if state is passed",
        () {
      checkIfUserHasTheQuestionStore.audioStateOrErrorUpdater(
        ConstantLocalAudioStreamStatusEntity.wrappedUnmutedCase,
      );
      expect(
        checkIfUserHasTheQuestionStore.isMuted,
        false,
      );
    });
    test(
        "✅ Success Mute Local Audio Case: should update accordingly if state is passed",
        () {
      checkIfUserHasTheQuestionStore.stateOrErrorUpdater(
        ConstantLocalAudioStreamStatusEntity.wrappedMutedCase,
      );
      expect(
        checkIfUserHasTheQuestionStore.isMuted,
        true,
      );
    });

    test(
        "❌ Failure Local Audio Case: should update accordingly if failure is passed",
        () {
      checkIfUserHasTheQuestionStore.audioStateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(checkIfUserHasTheQuestionStore.isMuted, true);
      expect(checkIfUserHasTheQuestionStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });

  group("callStateOrErrorUpdater", () {
    test(
        "✅ Success Join Call Case: should update accordingly if state is passed",
        () {
      checkIfUserHasTheQuestionStore.callStateOrErrorUpdater(
        ConstantCallStatusEntity.wrappedJoiningCase,
      );
      expect(checkIfUserHasTheQuestionStore.callStatus, CallStatus.joining);
    });
    test(
        "✅ Success Leave Call Case: should update accordingly if state is passed",
        () {
      print(checkIfUserHasTheQuestionStore.callStatus);
      checkIfUserHasTheQuestionStore.callStateOrErrorUpdater(
        ConstantCallStatusEntity.wrappedLeavingCase,
      );
      expect(checkIfUserHasTheQuestionStore.callStatus, CallStatus.leaving);
    });

    test(
        "❌ Failure Local Call Case: should update accordingly if failure is passed",
        () {
      checkIfUserHasTheQuestionStore.callStateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(checkIfUserHasTheQuestionStore.callStatus, CallStatus.initial);
      expect(checkIfUserHasTheQuestionStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });

  group("muteOrUnmuteAudio", () {
    //
    test("✅ Success Unmute Case: should update accordingly if state is passed",
        () async {
      when(mockUnmuteLocalAudioStream()).thenAnswer(
        (_) async => ConstantLocalAudioStreamStatusEntity.wrappedUnmutedCase,
      );
      await checkIfUserHasTheQuestionStore.muteOrUnmuteAudio(wantToMute: false);
      expect(
        checkIfUserHasTheQuestionStore.isMuted,
        false,
      );
      expect(checkIfUserHasTheQuestionStore.errorMessage, "");
    });
    test("✅ Success Mute Case: should update accordingly if state is passed",
        () async {
      when(mockMuteLocalAudioStream()).thenAnswer(
        (_) async => ConstantLocalAudioStreamStatusEntity.wrappedMutedCase,
      );
      await checkIfUserHasTheQuestionStore.muteOrUnmuteAudio(wantToMute: true);
      expect(
        checkIfUserHasTheQuestionStore.isMuted,
        true,
      );
      expect(checkIfUserHasTheQuestionStore.errorMessage, "");
    });
    test("❌ Mute Failure Case: should update accordingly if failure is passed",
        () async {
      when(mockMuteLocalAudioStream()).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await checkIfUserHasTheQuestionStore.muteOrUnmuteAudio(wantToMute: true);
      expect(checkIfUserHasTheQuestionStore.isMuted, true);
      expect(checkIfUserHasTheQuestionStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
    test(
        "❌ Unmute Failure Case: should update accordingly if failure is passed",
        () async {
      when(mockUnmuteLocalAudioStream()).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await checkIfUserHasTheQuestionStore.muteOrUnmuteAudio(wantToMute: false);
      expect(checkIfUserHasTheQuestionStore.isMuted, true);
      expect(checkIfUserHasTheQuestionStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });

  group("joinOrLeaveCall", () {
    //
    test("✅ Success Join Case: should update accordingly if state is passed",
        () async {
      when(mockJoinCallGetterStore(
              channelId: joinCallParams.channelId, token: joinCallParams.token))
          .thenAnswer(
        (_) async => ConstantCallStatusEntity.wrappedJoiningCase,
      );
      await checkIfUserHasTheQuestionStore
          .enterOrLeaveCall(const Right(joinCallParams));
      expect(
        checkIfUserHasTheQuestionStore.callStatus,
        CallStatus.joining,
      );
      expect(checkIfUserHasTheQuestionStore.errorMessage, "");
    });
    test("✅ Success Leave Case: should update accordingly if state is passed",
        () async {
      when(mockLeaveCallGetterStore()).thenAnswer(
        (_) async => ConstantCallStatusEntity.wrappedLeavingCase,
      );
      await checkIfUserHasTheQuestionStore.enterOrLeaveCall(Left(tParams));
      expect(
        checkIfUserHasTheQuestionStore.callStatus,
        CallStatus.leaving,
      );
      expect(checkIfUserHasTheQuestionStore.errorMessage, "");
    });
    test("❌ Join Failure Case: should update accordingly if failure is passed",
        () async {
      when(mockJoinCallGetterStore(
              channelId: joinCallParams.channelId, token: joinCallParams.token))
          .thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await checkIfUserHasTheQuestionStore
          .enterOrLeaveCall(const Right(joinCallParams));
      expect(checkIfUserHasTheQuestionStore.isMuted, true);
      expect(checkIfUserHasTheQuestionStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
    test("❌ Leave Failure Case: should update accordingly if failure is passed",
        () async {
      when(mockLeaveCallGetterStore()).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await checkIfUserHasTheQuestionStore.enterOrLeaveCall(Left(tParams));
      expect(checkIfUserHasTheQuestionStore.isMuted, true);
      expect(checkIfUserHasTheQuestionStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });
}
