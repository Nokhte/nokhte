// import 'package:primala/app/modules/p2p_purpose_session/domain/logic/logic.dart';

import 'package:http/http.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala_backend/token_server.dart';

abstract class P2PPurposeSessionRemoteSource {
  Future<Response> fetchAgoraToken({
    required String channelName,

    /// 1 means they can talk, 2 means they can only listen
    int tokenRole = 1,
  });
}

class P2PPurposeSessionRemoteSourceImpl
    implements P2PPurposeSessionRemoteSource {
  final SupabaseClient supabase;
  final String currentUserUID;

  P2PPurposeSessionRemoteSourceImpl({required this.supabase})
      : currentUserUID = supabase.auth.currentUser?.id ?? '';

  @override
  Future<Response> fetchAgoraToken({
    required String channelName,
    int tokenRole = 1,
    int tokenExpireTime = 95,
  }) async {
    return await TokenServer.fetchAgoraToken(
      currentUserUID: currentUserUID,
      channelName: channelName,
    );
  }
}
