import 'package:supabase_flutter/supabase_flutter.dart';

abstract class P2PRequestSenderRemoteSource {
  Future<List<dynamic>> checkIfRecipientExists(String username);

  Future<List<dynamic>> sendARequest(String username);

  Future<List<dynamic>> checkForRecipientDuplicate(String username);
  Future<List<dynamic>> checkForSenderDuplicate(String username);
}

class P2PRequestSenderRemoteSourceImpl implements P2PRequestSenderRemoteSource {
  final SupabaseClient supabase;
  final String currentUserId;

  P2PRequestSenderRemoteSourceImpl({required this.supabase})
      : currentUserId = supabase.auth.currentUser?.id ?? "";

  @override
  Future<List> checkIfRecipientExists(String username) async {
    return await supabase.from('usernames').select().eq('username', username);
  }

  @override
  Future<List<dynamic>> checkForRecipientDuplicate(String uid) async {
    return await supabase
        .from('p2p_requests')
        .select()
        .eq('receiver_id', currentUserId)
        .eq('sender_id', uid);
  }

  @override
  Future<List<dynamic>> checkForSenderDuplicate(String uid) async {
    return await supabase
        .from('p2p_requests')
        .select()
        .eq('receiver_id', uid)
        .eq('sender_id', currentUserId);
  }

  @override
  Future<List> sendARequest(String username) async {
    final receiverUIDRes =
        await supabase.from('usernames').select().eq('username', username);
    final receiverUID = receiverUIDRes[0]['uid'];
    return await supabase
        .from('p2p_requests')
        .insert({'sender_id': currentUserId, 'receiver_id': receiverUID});
  }
}
