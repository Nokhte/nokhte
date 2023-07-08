import '../../util/p2p_requests/supabase_p2p_request_row_response.dart';
import '../../util/p2p_requests/supabase_p2p_request_row_request.dart';
import '../general/user_data_constants.dart';

class SupabaseP2PRequestRowConstants {
  static firstToSecondUserRequest(
      {required String senderUID, required String receiverUID}) {
    return SupabaseP2PRequestRowRequest(
      sender_id: senderUID,
      receiver_id: receiverUID,
    );
  }

  static firstToSecondUserResponse() {
    return SupabaseP2PRequestRowResponse(
      sender_id: UserDataConstants.user1UID,
      receiver_id: UserDataConstants.user2UID,
      sent_at: DateTime.now().toIso8601String(),
      responded_at: null,
      is_accepted: false,
    );
  }

  static secondToFirstUserRequest(
      {required String senderUID, required String receiverUID}) {
    return SupabaseP2PRequestRowRequest(
      sender_id: senderUID,
      receiver_id: receiverUID,
    );
  }

  static secondToFirstUserResponse() {
    return SupabaseP2PRequestRowResponse(
      sender_id: UserDataConstants.user1UID,
      receiver_id: UserDataConstants.user2UID,
      sent_at: DateTime.now().toIso8601String(),
      responded_at: null,
      is_accepted: false,
    );
  }
}
