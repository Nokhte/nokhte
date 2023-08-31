// import 'package:primala/app/modules/p2p_purpose_session/domain/logic/logic.dart';

import 'package:http/http.dart';
import 'package:primala/app/core/utilities/utilities.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/main/sub_stores/agora_callbacks_store.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala_backend/token_server.dart';
import 'package:primala_backend/existing_collaborations.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

abstract class P2PPurposeSessionRemoteSource {
  Future<Response> fetchAgoraToken({required String channelName});

  /// needs logic & status entity
  Future instantiateAgoraSDK();

  /// needs logic & status entity
  Future joinCall({required String token, required String channelId});

  /// needs logic & status entity
  Future leaveCall();

  /// needs logic & status entity
  Future<List<dynamic>> fetchChannelId();
}

class P2PPurposeSessionRemoteSourceImpl
    implements P2PPurposeSessionRemoteSource {
  final SupabaseClient supabase;
  final AgoraCallbacksStore agoraCallbacksStore;
  final String currentUserUID;
  final RtcEngine agoraEngine; // should call createAgoraRtcEngine() in module

  P2PPurposeSessionRemoteSourceImpl({
    required this.supabase,
    required this.agoraCallbacksStore,
    required this.agoraEngine,
  }) : currentUserUID = supabase.auth.currentUser?.id ?? '';

  @override
  Future<Response> fetchAgoraToken({
    required String channelName,
  }) async {
    return await TokenServer.fetchAgoraToken(
      currentUserUID: MiscAlgos.postgresUIDToInt(currentUserUID),
      channelName: channelName,
    );
  }

  @override
  Future<void> joinCall(
      {required String token, required String channelId}) async {
    ChannelMediaOptions options = const ChannelMediaOptions(
      clientRoleType: ClientRoleType.clientRoleBroadcaster,
      // channelProfile: ChannelProfileType.channelProfileCommunication,
    );
    return await agoraEngine.joinChannel(
        token: token,
        channelId: channelId,
        uid: MiscAlgos.postgresUIDToInt(currentUserUID),
        options: options);
  }

  @override
  Future<void> leaveCall() async {
    return await agoraEngine.leaveChannel();
  }

  @override
  Future<void> instantiateAgoraSDK() async {
    RtcEngineEventHandler(onJoinChannelSuccess: (connection, elapsed) {
      agoraCallbacksStore.onCallJoined();
    }, onLeaveChannel: (connection, elapsed) {
      agoraCallbacksStore.onCallLeft();
    });

    return await agoraEngine.initialize(const RtcEngineContext(
      appId: '050b22b688f44464b2533fac484c7300',
    ));
  }

  @override
  Future<List> fetchChannelId() async {
    return await ExistingCollaborationsQueries.fetchCollaborationInfo(
      supabase: supabase,
      currentUserUID: currentUserUID,
    );
  }
}
