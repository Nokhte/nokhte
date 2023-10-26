import 'package:supabase_flutter/supabase_flutter.dart';

/// the most common ones are
/// user1InitialSchedulingRequest
/// user2SchedulingResponse
class CommonP2PSchedulingQueries {
  static Future<dynamic> successfulUser2SchedulingRes(
      {required SupabaseClient supabase,
      required String firstUserUID,
      required String secondUserUID}) async {
    return await supabase
        .from('p2p_scheduling')
        .update({
          'response_timestampz': DateTime.now().toIso8601String(),
          'range_has_been_responded_to': true,
        })
        .eq('sender_id', firstUserUID)
        .eq('receiver_id', secondUserUID);
  }

  static Future<dynamic> successfulUser1ConfirmationRes(
      {required SupabaseClient supabase,
      required String firstUserUID,
      required String secondUserUID}) async {
    await supabase
        .from('p2p_scheduling')
        .update({'time_is_agreed_upon': true})
        .eq('sender_id', firstUserUID)
        .eq('receiver_id', secondUserUID);
  }

  static Future<List<dynamic>> readTheSchedulingRequest({
    required SupabaseClient supabase,
    required String firstUserUID,
    required String secondUserUID,
  }) async {
    final res = await supabase
        .from('p2p_scheduling')
        .select()
        .eq('sender_id', firstUserUID)
        .eq('receiver_id', secondUserUID);
    return res;
  }
}
