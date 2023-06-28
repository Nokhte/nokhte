import 'package:supabase_flutter/supabase_flutter.dart';

abstract class P2PSchedulingSenderRemoteSource {
  Future<List<dynamic>> sendSchedulingRequest(
      String receiverUID, Map<String, dynamic> initialTimeRanges);

  Future<List<dynamic>> confirmSchedulingTime(String receiverUID);
}

class P2PSchedulingSenderRemoteSourceImpl
    implements P2PSchedulingSenderRemoteSource {
  final SupabaseClient supabase;

  P2PSchedulingSenderRemoteSourceImpl({required this.supabase});

  @override
  Future<List<dynamic>> sendSchedulingRequest(
      String receiverUID, Map<String, dynamic> initialTimeRanges) async {
    final currentUserUID = supabase.auth.currentUser?.id;
    await supabase.from('p2p_scheduling').insert({
      "sender_id": currentUserUID,
      "receiver_id": receiverUID,
      "initial_time_ranges": initialTimeRanges,
    });
    return await supabase
        .from('p2p_scheduling')
        .select()
        .eq('sender_id', currentUserUID)
        .eq('receiver_id', receiverUID);
  }

  @override
  Future<List> confirmSchedulingTime(String receiverUID) async {
    final currentUserUID = supabase.auth.currentUser?.id;
    await supabase
        .from('p2p_scheduling')
        .update({"time_is_agreed_upon": true})
        .eq('sender_id', currentUserUID)
        .eq('receiver_id', receiverUID);
    return await supabase
        .from('p2p_scheduling')
        .select('time_is_agreed_upon')
        .eq('sender_id', currentUserUID)
        .eq('receiver_id', receiverUID);
  }
}
