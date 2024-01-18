import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import '../../constants/entities/entities.dart';
import '../../fixtures/voice_call_mock_gen.mocks.dart';

void main() {
  late MockJoinCall mockJoinCall;
  late MockLeaveCall mockLeaveCall;
  late MockMuteLocalAudio mockMuteLocalAudio;
  late MockUnmuteLocalAudio mockUnmuteLocalAudio;
  late VoiceCallActionsStore voiceCallCoordinator;
  final tParams = NoParams();
  const joinCallParams = JoinCallParams(channelId: "channelId", token: "token");

  setUp(() {
    mockJoinCall = MockJoinCall();
    mockLeaveCall = MockLeaveCall();
    mockMuteLocalAudio = MockMuteLocalAudio();
    mockUnmuteLocalAudio = MockUnmuteLocalAudio();
    voiceCallCoordinator = VoiceCallActionsStore(
      joinCall: mockJoinCall,
      leaveCall: mockLeaveCall,
      muteAudio: mockMuteLocalAudio,
      unmuteAudio: mockUnmuteLocalAudio,
    );
  });

  group("audioStateOrErrorUpdater", () {
    test(
        "✅ Success Unmute Local Audio Case: should update accordingly if state is passed",
        () {
      voiceCallCoordinator.audioStateOrErrorUpdater(
        ConstantLocalAudioStreamStatusEntity.wrappedUnmutedCase,
      );
      expect(
        voiceCallCoordinator.isMuted,
        false,
      );
    });
    test(
        "✅ Success Mute Local Audio Case: should update accordingly if state is passed",
        () {
      voiceCallCoordinator.stateOrErrorUpdater(
        ConstantLocalAudioStreamStatusEntity.wrappedMutedCase,
      );
      expect(
        voiceCallCoordinator.isMuted,
        true,
      );
    });

    test(
        "❌ Failure Local Audio Case: should update accordingly if failure is passed",
        () {
      voiceCallCoordinator.audioStateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(voiceCallCoordinator.isMuted, true);
      expect(voiceCallCoordinator.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });

  group("callStateOrErrorUpdater", () {
    test(
        "✅ Success Join Call Case: should update accordingly if state is passed",
        () {
      voiceCallCoordinator.callStateOrErrorUpdater(
        ConstantCallStatusEntity.wrappedJoiningCase,
      );
      expect(voiceCallCoordinator.callStatus, CallStatus.joining);
    });
    test(
        "✅ Success Leave Call Case: should update accordingly if state is passed",
        () {
      voiceCallCoordinator.callStateOrErrorUpdater(
        ConstantCallStatusEntity.wrappedLeavingCase,
      );
      expect(voiceCallCoordinator.callStatus, CallStatus.leaving);
    });

    test(
        "❌ Failure Local Call Case: should update accordingly if failure is passed",
        () {
      voiceCallCoordinator.callStateOrErrorUpdater(
        Left(FailureConstants.dbFailure),
      );
      expect(voiceCallCoordinator.callStatus, CallStatus.initial);
      expect(voiceCallCoordinator.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });

  group("muteOrUnmuteAudio", () {
    test("✅ Success Unmute Case: should update accordingly if state is passed",
        () async {
      when(mockUnmuteLocalAudio(NoParams())).thenAnswer(
        (_) async => ConstantLocalAudioStreamStatusEntity.wrappedUnmutedCase,
      );
      await voiceCallCoordinator.muteOrUnmuteAudio(wantToMute: false);
      expect(
        voiceCallCoordinator.isMuted,
        false,
      );
      expect(voiceCallCoordinator.errorMessage, "");
    });
    test("✅ Success Mute Case: should update accordingly if state is passed",
        () async {
      when(mockMuteLocalAudio(NoParams())).thenAnswer(
        (_) async => ConstantLocalAudioStreamStatusEntity.wrappedMutedCase,
      );
      await voiceCallCoordinator.muteOrUnmuteAudio(wantToMute: true);
      expect(
        voiceCallCoordinator.isMuted,
        true,
      );
      expect(voiceCallCoordinator.errorMessage, "");
    });
    test("❌ Mute Failure Case: should update accordingly if failure is passed",
        () async {
      when(mockMuteLocalAudio(NoParams())).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await voiceCallCoordinator.muteOrUnmuteAudio(wantToMute: true);
      expect(voiceCallCoordinator.isMuted, true);
      expect(voiceCallCoordinator.errorMessage,
          FailureConstants.genericFailureMsg);
    });
    test(
        "❌ Unmute Failure Case: should update accordingly if failure is passed",
        () async {
      when(mockUnmuteLocalAudio(NoParams())).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await voiceCallCoordinator.muteOrUnmuteAudio(wantToMute: false);
      expect(voiceCallCoordinator.isMuted, true);
      expect(voiceCallCoordinator.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });

  group("joinOrLeaveCall", () {
    test("✅ Success Join Case: should update accordingly if state is passed",
        () async {
      when(
        mockJoinCall(
          JoinCallParams(
            token: joinCallParams.token,
            channelId: joinCallParams.channelId,
          ),
        ),
      ).thenAnswer(
        (_) async => ConstantCallStatusEntity.wrappedJoiningCase,
      );
      await voiceCallCoordinator.enterOrLeaveCall(const Right(joinCallParams));
      expect(
        voiceCallCoordinator.callStatus,
        CallStatus.joining,
      );
      expect(voiceCallCoordinator.errorMessage, "");
    });
    test("✅ Success Leave Case: should update accordingly if state is passed",
        () async {
      when(mockLeaveCall(NoParams())).thenAnswer(
        (_) async => ConstantCallStatusEntity.wrappedLeavingCase,
      );
      await voiceCallCoordinator.enterOrLeaveCall(Left(tParams));
      expect(
        voiceCallCoordinator.callStatus,
        CallStatus.leaving,
      );
      expect(voiceCallCoordinator.errorMessage, "");
    });
    test("❌ Join Failure Case: should update accordingly if failure is passed",
        () async {
      when(
        mockJoinCall(
          JoinCallParams(
            token: joinCallParams.token,
            channelId: joinCallParams.channelId,
          ),
        ),
      ).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await voiceCallCoordinator.enterOrLeaveCall(const Right(joinCallParams));
      expect(voiceCallCoordinator.isMuted, true);
      expect(voiceCallCoordinator.errorMessage,
          FailureConstants.genericFailureMsg);
    });
    test("❌ Leave Failure Case: should update accordingly if failure is passed",
        () async {
      when(mockLeaveCall(NoParams())).thenAnswer(
        (_) async => Left(FailureConstants.dbFailure),
      );
      await voiceCallCoordinator.enterOrLeaveCall(Left(tParams));
      expect(voiceCallCoordinator.isMuted, true);
      expect(voiceCallCoordinator.errorMessage,
          FailureConstants.genericFailureMsg);
    });
  });
}
