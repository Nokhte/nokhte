import 'package:supabase_flutter/supabase_flutter.dart';

abstract class P2PSchedulingRecipientRemoteSource {
  Future<List<dynamic>> respondToSchedulingRequest(
    String originalSenderUID,
    String responseTimestampz,
  );
}

class P2PSchedulingRecipientRemoteSourceImpl
    implements P2PSchedulingRecipientRemoteSource {
  final SupabaseClient supabase;

  P2PSchedulingRecipientRemoteSourceImpl({required this.supabase});

  @override
  Future<List> respondToSchedulingRequest(
      String originalSenderUID, String responseTimestampz) async {
    final currentUserUID = supabase.auth.currentUser?.id;
    await supabase.from('p2p_scheduling').update({
      "response_timestampz": responseTimestampz,
      "range_has_been_responded_to": true,
    });
    return await supabase
        .from('p2p_scheduling')
        .select()
        .eq('receiver_id', currentUserUID)
        .eq('sender_id', originalSenderUID);
  }
}
