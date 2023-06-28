import 'package:primala/app/modules/p2p_request_sender/domain/entities/p2p_request_recipient_entity.dart';

class P2PRequestSenderRecipientModel extends P2PRequestRecipientEntity {
  const P2PRequestSenderRecipientModel({
    required bool exists,
    required bool dupRecip,
    required bool dupSender,
  }) : super(
          exists: exists,
          duplicateSender: dupSender,
          duplicateRecipient: dupRecip,
        );

  static fromSupabase(P2PRequestSenderRecipientModelParams supabaseQueries) {
    return P2PRequestSenderRecipientModel(
      exists: supabaseQueries.existsRes.isNotEmpty,
      dupRecip: supabaseQueries.recipDupRes.isNotEmpty,
      dupSender: supabaseQueries.senderDupRes.isNotEmpty,
    );
  }
}

class P2PRequestSenderRecipientModelParams {
  List<dynamic> existsRes;
  List<dynamic> recipDupRes;
  List<dynamic> senderDupRes;

  P2PRequestSenderRecipientModelParams({
    required this.existsRes,
    required this.recipDupRes,
    required this.senderDupRes,
  });
}
