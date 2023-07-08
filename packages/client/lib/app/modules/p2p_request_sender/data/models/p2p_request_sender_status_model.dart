import 'package:primala/app/modules/p2p_request_sender/domain/entities/p2p_request_sender_status_entity.dart';

class P2PRequestSenderStatusModel extends P2PRequestSenderStatusEntity {
  const P2PRequestSenderStatusModel({required bool isSent})
      : super(isSent: isSent);
  static P2PRequestSenderStatusModel fromSupabase(
      List<dynamic> supabaseQueryRes) {
    if (supabaseQueryRes.isEmpty) {
      return const P2PRequestSenderStatusModel(isSent: false);
    } else {
      return const P2PRequestSenderStatusModel(isSent: true);
    }
  }
}
