import 'package:primala/app/modules/deprecated/p2p_request_recipient/domain/entities/p2p_recipient_request_entity.dart';

class P2PRecipientRequestModel extends P2PRecipientRequestEntity {
  const P2PRecipientRequestModel({required List<P2PRecipientRequest> requests})
      : super(requests: requests);

  static P2PRecipientRequestModel fromSupabase(List<dynamic> sbQueryRes) {
    if (sbQueryRes.isEmpty) {
      return const P2PRecipientRequestModel(requests: []);
    } else {
      final requestsList = sbQueryRes.map((element) {
        final sentAt = element['sent_at'] as String;
        final senderUsername = element['usernames']['username'] as String;

        return P2PRecipientRequest(
            timestampz: sentAt, senderUsername: senderUsername);
      }).toList();

      return P2PRecipientRequestModel(requests: requestsList);
    }
  }
}
// so this is going to be the resonse shape for our query
// [{
//  request_id: 82cc910c-9bd7-447a-857a-255a288fa7d0,
//  sender_id: 3ad354ef-0671-479c-aea2-686c28636d8d,
//  receiver_id: 4f899180-dfe5-43e5-afd0-ab5b2c2f985a,
//  sent_at: 2023-06-09T18:14:47.802293+00:00,
//  responded_at: null,
//  is_accepted: false,
//  usernames: {username: tester}
// }]