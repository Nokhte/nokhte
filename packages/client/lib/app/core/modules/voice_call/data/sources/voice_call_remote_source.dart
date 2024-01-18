import 'package:http/http.dart';
import 'package:nokhte/app/core/utilities/utilities.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nokhte_backend/token_server/token_server.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class VoiceCallRemoteSource {
  Future<Response> getAgoraToken({required String channelName});

  Future joinCall({required String token, required String channelId});

  Future leaveCall();

  Future muteLocalAudio();

  Future unmuteLocalAudio();

  Future<List<dynamic>> getCollaboratorInfo();

  Future<RtcEngine> initAgoraSdk();
}

class VoiceCallRemoteSourceImpl implements VoiceCallRemoteSource {
  final SupabaseClient supabase;
  final ExistingCollaborationsQueries existingCollaborationsQueries;
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
        existingCollaborationsQueries =
            ExistingCollaborationsQueries(supabase: supabase);

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
  Future<List> getCollaboratorInfo() async {
    return [
      await existingCollaborationsQueries.getCollaborations(
          filterForIsActive: true),
      currentUserUID
    ];
  }

  @override
  Future muteLocalAudio() async {
    return await agoraEngine.muteLocalAudioStream(true);
  }

  @override
  Future unmuteLocalAudio() async {
    return await agoraEngine.muteLocalAudioStream(false);
  }
}
