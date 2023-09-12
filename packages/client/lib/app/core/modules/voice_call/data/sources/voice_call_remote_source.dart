// import 'package:primala/app/modules/p2p_purpose_session/domain/logic/logic.dart';

import 'package:http/http.dart';
import 'package:primala/app/core/utilities/utilities.dart';
import 'package:primala/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala_backend/token_server.dart';
import 'package:primala_backend/existing_collaborations.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

abstract class VoiceCallRemoteSource {
  Future<Response> fetchAgoraToken({required String channelName});

  /// needs logic & status entity
  Future instantiateAgoraSDK();

  /// needs logic & status entity
  Future joinCall({required String token, required String channelId});

  /// needs logic & status entity
  Future leaveCall();

  Future muteLocalAudioStream();

  Future unmuteLocalAudioStream();

  /// needs logic & status entity
  // Future<List<dynamic>> fetchChannelId();
  Future<List<dynamic>> fetchCollaboratorInfo();
  // Future<List> fetchWhoGetsQuestion();
}

class VoiceCallRemoteSourceImpl implements VoiceCallRemoteSource {
  final SupabaseClient supabase;
  final AgoraCallbacksStore agoraCallbacksStore;
  final String currentUserUID;
  final int currentAgoraUID;
  final RtcEngine agoraEngine; // should call createAgoraRtcEngine() in module

  VoiceCallRemoteSourceImpl({
    required this.supabase,
    required this.agoraCallbacksStore,
    required this.agoraEngine,
  })  : currentUserUID = supabase.auth.currentUser?.id ?? '',
        currentAgoraUID = MiscAlgos.postgresUIDToInt(
          supabase.auth.currentUser?.id ?? '',
        );

  @override
  Future<Response> fetchAgoraToken({
    required String channelName,
  }) async {
    return await TokenServer.fetchAgoraToken(
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
  Future<List> fetchCollaboratorInfo() async {
    return [
      await ExistingCollaborationsQueries.fetchCollaborationInfo(
        supabase: supabase,
        currentUserUID: currentUserUID,
      ),
      currentUserUID
    ];
  }

  @override
  Future muteLocalAudioStream() async {
    return await agoraEngine.muteLocalAudioStream(true);
  }

  @override
  Future unmuteLocalAudioStream() async {
    return await agoraEngine.muteLocalAudioStream(false);
  }
}
