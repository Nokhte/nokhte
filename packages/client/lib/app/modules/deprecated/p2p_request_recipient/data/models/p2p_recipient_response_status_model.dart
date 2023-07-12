import 'package:primala/app/modules/deprecated/p2p_request_recipient/domain/entities/p2p_recipient_response_status_entity.dart';

class P2PRequestRecipientResponseStatusModel
    extends P2PRequestRecipientResponseStatusEntity {
  const P2PRequestRecipientResponseStatusModel({required bool isSent})
      : super(isSent: isSent);

  static P2PRequestRecipientResponseStatusModel fromSupabase(
      List<dynamic> sbQueryRes) {
    if (sbQueryRes.isEmpty) {
      return const P2PRequestRecipientResponseStatusModel(isSent: false);
    } else {
      return const P2PRequestRecipientResponseStatusModel(isSent: true);
    }
  }
}
