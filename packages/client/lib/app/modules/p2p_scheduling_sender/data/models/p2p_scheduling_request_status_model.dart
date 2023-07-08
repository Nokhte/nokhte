import 'package:primala/app/modules/p2p_scheduling_sender/domain/entities/p2p_scheduling_request_status_entity.dart';

class P2PSchedulingRequestStatusModel extends P2PSchedulingRequestStatusEntity {
  const P2PSchedulingRequestStatusModel({required isSent})
      : super(isSent: isSent);

  static fromSupabase(List<dynamic> supabaseQueryRes) {
    return supabaseQueryRes.isEmpty
        ? const P2PSchedulingRequestStatusModel(isSent: false)
        : const P2PSchedulingRequestStatusModel(isSent: true);
  }
}
// ok the next thing to do is to test it
//I think we should go about this in the way of testing this first
// to make sure it works, and then apply it to all the other status models
// so we can get rid of this recycled logic