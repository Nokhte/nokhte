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
  late VoiceCallActionsStore voiceCallActionsStore;
  final tParams = NoParams();
  const joinCallParams = JoinCallParams(channelId: "channelId", token: "token");

  setUp(() {
    mockJoinCallGetterStore = MockMJoinCallGetterStore();
    mockLeaveCallGetterStore = MockMLeaveCallGetterStore();
    mockMuteLocalAudioStream = MockMMuteLocalAudioStreamGetterStore();
    mockUnmuteLocalAudioStream = MockMUnmuteLocalAudioStreamGetterStore();
    voiceCallActionsStore = VoiceCallActionsStore(
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
      voiceCallActionsStore.audioStateOrErrorUpdater(
        ConstantLocalAudioStreamStatusEntity.wrappedUnmutedCase,
      );
      expect(
        voiceCallActionsStore.isMuted,
        false,
      );
    });
    test(
        "✅ Success Mute Local Audio Case: should update accordingly if state is passed",
        () {
      voiceCallActionsStore.stateOrErrorUpdater(
        ConstantLocalAudioStreamStatusEntity.wrappedMutedCase,
      );
      expect(
        voiceCallActionsStore.isMuted,
        true,
      );
    });

    test(
        "❌ Failure Local Audio Case: should update accordingly if failure is passed",
        () {
      voiceCallActionsStore.audioStateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(voiceCallActionsStore.isMuted, true);
      expect(voiceCallActionsStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });

  group("callStateOrErrorUpdater", () {
    test(
        "✅ Success Join Call Case: should update accordingly if state is passed",
        () {
      voiceCallActionsStore.callStateOrErrorUpdater(
        ConstantCallStatusEntity.wrappedJoiningCase,
      );
      expect(voiceCallActionsStore.callStatus, CallStatus.joining);
    });
    test(
        "✅ Success Leave Call Case: should update accordingly if state is passed",
        () {
      print(voiceCallActionsStore.callStatus);
      voiceCallActionsStore.callStateOrErrorUpdater(
        ConstantCallStatusEntity.wrappedLeavingCase,
      );
      expect(voiceCallActionsStore.callStatus, CallStatus.leaving);
    });

    test(
        "❌ Failure Local Call Case: should update accordingly if failure is passed",
        () {
      voiceCallActionsStore.callStateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(voiceCallActionsStore.callStatus, CallStatus.initial);
      expect(voiceCallActionsStore.errorMessage,
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
      await voiceCallActionsStore.muteOrUnmuteAudio(wantToMute: false);
      expect(
        voiceCallActionsStore.isMuted,
        false,
      );
      expect(voiceCallActionsStore.errorMessage, "");
    });
    test("✅ Success Mute Case: should update accordingly if state is passed",
        () async {
      when(mockMuteLocalAudioStream()).thenAnswer(
        (_) async => ConstantLocalAudioStreamStatusEntity.wrappedMutedCase,
      );
      await voiceCallActionsStore.muteOrUnmuteAudio(wantToMute: true);
      expect(
        voiceCallActionsStore.isMuted,
        true,
      );
      expect(voiceCallActionsStore.errorMessage, "");
    });
    test("❌ Mute Failure Case: should update accordingly if failure is passed",
        () async {
      when(mockMuteLocalAudioStream()).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await voiceCallActionsStore.muteOrUnmuteAudio(wantToMute: true);
      expect(voiceCallActionsStore.isMuted, true);
      expect(voiceCallActionsStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
    test(
        "❌ Unmute Failure Case: should update accordingly if failure is passed",
        () async {
      when(mockUnmuteLocalAudioStream()).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await voiceCallActionsStore.muteOrUnmuteAudio(wantToMute: false);
      expect(voiceCallActionsStore.isMuted, true);
      expect(voiceCallActionsStore.errorMessage,
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
      await voiceCallActionsStore.enterOrLeaveCall(const Right(joinCallParams));
      expect(
        voiceCallActionsStore.callStatus,
        CallStatus.joining,
      );
      expect(voiceCallActionsStore.errorMessage, "");
    });
    test("✅ Success Leave Case: should update accordingly if state is passed",
        () async {
      when(mockLeaveCallGetterStore()).thenAnswer(
        (_) async => ConstantCallStatusEntity.wrappedLeavingCase,
      );
      await voiceCallActionsStore.enterOrLeaveCall(Left(tParams));
      expect(
        voiceCallActionsStore.callStatus,
        CallStatus.leaving,
      );
      expect(voiceCallActionsStore.errorMessage, "");
    });
    test("❌ Join Failure Case: should update accordingly if failure is passed",
        () async {
      when(mockJoinCallGetterStore(
              channelId: joinCallParams.channelId, token: joinCallParams.token))
          .thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await voiceCallActionsStore.enterOrLeaveCall(const Right(joinCallParams));
      expect(voiceCallActionsStore.isMuted, true);
      expect(voiceCallActionsStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
    test("❌ Leave Failure Case: should update accordingly if failure is passed",
        () async {
      when(mockLeaveCallGetterStore()).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await voiceCallActionsStore.enterOrLeaveCall(Left(tParams));
      expect(voiceCallActionsStore.isMuted, true);
      expect(voiceCallActionsStore.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });
}
