import 'package:supabase_flutter/supabase_flutter.dart';

abstract class P2PRequestRecipientRemoteSource {
  Future<List<dynamic>> loadRequests();

  Future<List<dynamic>> respondToARequest(String senderUsername);
}

class P2PRequestRecipientRemoteSourceImpl
    implements P2PRequestRecipientRemoteSource {
  final SupabaseClient supabase;
  final String currentUserId;

  P2PRequestRecipientRemoteSourceImpl({required this.supabase})
      : currentUserId = supabase.auth.currentUser?.id ?? "";
  @override
  Future<List> loadRequests() async {
    return await supabase
        .from('p2p_requests')
        .select(
          '*, usernames!p2p_requests_sender_id_fkey(username)',
        )
        .eq('receiver_id', currentUserId);
  }

  @override
  Future<List> respondToARequest(String senderUsername) async {
    final senderUIDRes = await supabase
        .from('usernames')
        .select()
        .eq('username', senderUsername);
    final senderUID = senderUIDRes[0]['uid'];

    return await supabase
        .from('p2p_requests')
        .update({
          'is_accepted': true,
          'responded_at': DateTime.now().toIso8601String(),
        })
        .eq('sender_id', senderUID)
        .eq('receiver_id', currentUserId);
  }
}
