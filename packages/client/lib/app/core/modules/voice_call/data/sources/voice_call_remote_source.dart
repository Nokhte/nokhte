import 'package:http/http.dart';
import 'package:nokhte/app/core/utilities/utilities.dart';
import 'package:nokhte_backend/tables/irl_active_nokhte_sessions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nokhte_backend/token_server/token_server.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path_provider/path_provider.dart';

abstract class VoiceCallRemoteSource {
  Future<Response> getAgoraToken({required String channelName});

  Future joinCall({required String token, required String channelId});

  Future leaveCall();

  Future<void> muteLocalAudio();

  Future<void> unmuteLocalAudio();

  Future<String> getNokhteSessionMeetingId();

  Future<RtcEngine> initAgoraSdk();
  Future<void> startRecording(String fileName);
  Future<void> stopRecording();
}

class VoiceCallRemoteSourceImpl implements VoiceCallRemoteSource {
  final SupabaseClient supabase;
  final IrlActiveNokhteSessionQueries activeNokhteSessionQueries;
  final String currentUserUID;
  final int currentAgoraUID;
  final RtcEngine agoraEngine;

  VoiceCallRemoteSourceImpl({
    required this.supabase,
  })  : agoraEngine = createAgoraRtcEngine(),
        currentUserUID = supabase.auth.currentUser?.id ?? '',
        currentAgoraUID = MiscAlgos.postgresUIDToInt(
          supabase.auth.currentUser?.id ?? '',
        ),
        activeNokhteSessionQueries =
            IrlActiveNokhteSessionQueries(supabase: supabase);

  @override
  Future<RtcEngine> initAgoraSdk() async {
    final agoraAppId = dotenv.env["AGORA_APP_ID"] ?? '';
    await agoraEngine.initialize(RtcEngineContext(appId: agoraAppId));
    return agoraEngine;
  }

  @override
  Future<Response> getAgoraToken({
    required String channelName,
  }) async {
    return await TokenServices.getAgoraToken(
      currentUserUID: currentAgoraUID,
      channelName: channelName,
    );
  }

  @override
  Future<void> joinCall(
      {required String token, required String channelId}) async {
    ChannelMediaOptions options = const ChannelMediaOptions(
      clientRoleType: ClientRoleType.clientRoleBroadcaster,
    );
    return await agoraEngine.joinChannel(
      token: token,
      channelId: channelId,
      uid: currentAgoraUID,
      options: options,
    );
  }

  @override
  Future<void> leaveCall() async {
    return await agoraEngine.leaveChannel();
  }

  @override
  Future<void> muteLocalAudio() async {
    return await agoraEngine.muteLocalAudioStream(true);
  }

  @override
  Future<void> unmuteLocalAudio() async {
    return await agoraEngine.muteLocalAudioStream(false);
  }

  @override
  Future<String> getNokhteSessionMeetingId() async =>
      await activeNokhteSessionQueries.getMeetingUID();

  @override
  stopRecording() async => await agoraEngine.stopAudioRecording();

  @override
  startRecording(String fileName) async =>
      await agoraEngine.startAudioRecording(
        AudioRecordingConfiguration(
          filePath: '${(await getTemporaryDirectory()).path}/$fileName.wav',
          fileRecordingType: AudioFileRecordingType.audioFileRecordingMic,
          quality: AudioRecordingQualityType.audioRecordingQualityHigh,
        ),
      );
}
