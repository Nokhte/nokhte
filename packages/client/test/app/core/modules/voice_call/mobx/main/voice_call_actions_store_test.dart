import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import '../../fixtures/voice_call_mock_gen.mocks.dart';

void main() {
  late MockJoinCall mockJoinCall;
  late MockLeaveCall mockLeaveCall;
  late MockMuteLocalAudio mockMuteLocalAudio;
  late MockStartRecording mockStartRecording;
  late MockStopRecording mockStopRecording;
  late MockUnmuteLocalAudio mockUnmuteLocalAudio;
  late VoiceCallActionsStore testStore;

  setUp(() {
    mockJoinCall = MockJoinCall();
    mockLeaveCall = MockLeaveCall();
    mockStartRecording = MockStartRecording();
    mockStopRecording = MockStopRecording();
    mockMuteLocalAudio = MockMuteLocalAudio();
    mockUnmuteLocalAudio = MockUnmuteLocalAudio();
    testStore = VoiceCallActionsStore(
      joinCallLogic: mockJoinCall,
      leaveCallLogic: mockLeaveCall,
      muteAudioLogic: mockMuteLocalAudio,
      unmuteAudioLogic: mockUnmuteLocalAudio,
      startRecordingLogic: mockStartRecording,
      stopRecordingLogic: mockStopRecording,
    );
  });

  test("startRecording", () async {
    when(mockStartRecording('_'))
        .thenAnswer((realInvocation) async => const Right(true));
    await testStore.startRecording('_');
    expect(testStore.isRecording, true);
  });

  test("stopRecording", () async {
    when(mockStopRecording(NoParams()))
        .thenAnswer((realInvocation) async => const Right(false));
    await testStore.stopRecording();
    expect(testStore.isRecording, false);
  });

  test("unmute", () async {
    when(mockUnmuteLocalAudio(NoParams()))
        .thenAnswer((realInvocation) async => const Right(false));
    await testStore.unmute();
    expect(testStore.isMuted, false);
  });

  test("mute", () async {
    when(mockMuteLocalAudio(NoParams()))
        .thenAnswer((realInvocation) async => const Right(true));
    await testStore.mute();
    expect(testStore.isMuted, true);
  });

  test("joinCall", () async {
    when(mockJoinCall(
            const JoinCallParams(token: 'token', channelId: 'channelId')))
        .thenAnswer((realInvocation) async => const Right(CallStatus.joined));
    await testStore
        .joinCall(const JoinCallParams(token: 'token', channelId: 'channelId'));
    expect(testStore.callStatus, CallStatus.joined);
  });

  test("leaveCall", () async {
    when(mockLeaveCall(NoParams()))
        .thenAnswer((realInvocation) async => const Right(CallStatus.leaving));
    await testStore.leaveCall(NoParams());
    expect(testStore.callStatus, CallStatus.leaving);
    //
  });
}
