// import 'package:primala/app/modules/p2p_purpose_session/domain/logic/logic.dart';

import 'package:http/http.dart';
import 'package:primala/app/core/utilities/utilities.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/main/agora_tracker_store.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala_backend/token_server.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

abstract class P2PPurposeSessionRemoteSource {
  Future<Response> fetchAgoraToken({
    required String channelName,
  });

  Future setupVoiceSDKEngine();

  Future joinCall({
    required String token,
    required String channelId,
  });

  Future leaveCall();

  Future dispose();

  Future<List<dynamic>> getChannelId();
}

class P2PPurposeSessionRemoteSourceImpl
    implements P2PPurposeSessionRemoteSource {
  final SupabaseClient supabase;
  final AgoraTrackerStore agoraTrackerStore;
  final String currentUserUID;
  final RtcEngine agoraEngine; // should call createAgoraRtcEngine() in module

  P2PPurposeSessionRemoteSourceImpl({
    required this.supabase,
    required this.agoraTrackerStore,
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
  Future dispose() async {
    await agoraEngine.leaveChannel();
  }

  /// make another function for channel id which will involve querying
  /// the existing_collaborators table and then making a concatenation

  @override
  Future joinCall({required String token, required String channelId}) async {
    ChannelMediaOptions options = const ChannelMediaOptions(
      clientRoleType: ClientRoleType.clientRoleBroadcaster,
      // channelProfile: ChannelProfileType.channelProfileCommunication,
    );
    await agoraEngine.joinChannel(
        token: token,
        channelId: channelId,
        uid: MiscAlgos.postgresUIDToInt(currentUserUID),
        options: options);
  }

  @override
  Future leaveCall() async {
    await agoraEngine.leaveChannel();
  }

  @override
  Future setupVoiceSDKEngine() async {
    await agoraEngine.initialize(const RtcEngineContext(
      appId: '050b22b688f44464b2533fac484c7300',
    ));

    RtcEngineEventHandler(onJoinChannelSuccess: (connection, elapsed) {
      agoraTrackerStore.joiningCall();
    }, onChannelMediaRelayStateChanged: (status, code) {
      agoraTrackerStore.leavingCall();
    });
  }

  @override
  Future<List> getChannelId() {
    /// go to the back end compose the function with a test,
    /// and then get this in here and then build the module...
    throw UnimplementedError();
  }
}
