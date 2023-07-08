import 'package:primala/app/modules/p2p_scheduling_recipient/domain/entities/p2p_scheduling_response_status_entity.dart';

class P2PSchedulingResponseStatusModel
    extends P2PSchedulingResponseStatusEntity {
  const P2PSchedulingResponseStatusModel({required super.isSent});

  static P2PSchedulingResponseStatusModel fromSupabase(
      List<dynamic> supabaseQueryRes) {
    const successCase = P2PSchedulingResponseStatusModel(isSent: true);
    const notSuccessCase = P2PSchedulingResponseStatusModel(isSent: false);

    if (supabaseQueryRes.isEmpty) return notSuccessCase;

    return supabaseQueryRes[0]["response_timestampz"] != null &&
            supabaseQueryRes[0]["range_has_been_responded_to"] == true
        ? successCase
        : notSuccessCase;
  }
}
