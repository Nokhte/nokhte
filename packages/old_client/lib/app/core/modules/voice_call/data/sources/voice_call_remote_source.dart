import 'package:http/http.dart';
import 'package:nokhte/app/core/utilities/utilities.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nokhte_backend/token_server/token_server.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

abstract class VoiceCallRemoteSource {
  Future<Response> getAgoraToken({required String channelName});

  Future instantiateAgoraSDK();

  Future joinCall({required String token, required String channelId});

  Future leaveCall();

  Future muteLocalAudio();

  Future unmuteLocalAudio();

  Future<List<dynamic>> getCollaboratorInfo();
}

class VoiceCallRemoteSourceImpl implements VoiceCallRemoteSource {
  final SupabaseClient supabase;
  final ExistingCollaborationsQueries existingCollaborationsQueries;
  final AgoraCallbacksStore agoraCallbacksStore;
  final String currentUserUID;
  final int currentAgoraUID;
  final RtcEngine agoraEngine;

  VoiceCallRemoteSourceImpl({
    required this.supabase,
    required this.agoraCallbacksStore,
    required this.agoraEngine,
  })  : currentUserUID = supabase.auth.currentUser?.id ?? '',
        currentAgoraUID = MiscAlgos.postgresUIDToInt(
          supabase.auth.currentUser?.id ?? '',
        ),
        existingCollaborationsQueries =
            ExistingCollaborationsQueries(supabase: supabase);

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
  Future<void> instantiateAgoraSDK() async {
    await agoraEngine.initialize(
        const RtcEngineContext(appId: '050b22b688f44464b2533fac484c7300'));
    agoraEngine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (connection, elapsed) =>
            agoraCallbacksStore.onCallJoined(),
        onLeaveChannel: (connection, elapsed) =>
            agoraCallbacksStore.onCallLeft(),
        onUserJoined: (connection, remoteUid, elapsed) =>
            agoraCallbacksStore.collaboratorHasJoined(),
        onUserOffline: (connection, remoteUid, reason) =>
            agoraCallbacksStore.collaboratorHasLeft(),
      ),
    );
  }

  @override
  Future<List> getCollaboratorInfo() async {
    return [
      await existingCollaborationsQueries.getActiveCollaborationInfo(),
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
