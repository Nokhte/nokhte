// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';

/// @dev Strict Typing for the reponse from the query for the table
class SupabaseP2PRequestRowResponse extends Equatable {
  final String sender_id;
  final String receiver_id;
  final String sent_at;
  final String? responded_at;
  final bool is_accepted;

  SupabaseP2PRequestRowResponse({
    required this.sender_id,
    required this.receiver_id,
    required this.sent_at,
    required this.responded_at,
    required this.is_accepted,
  });

  @override
  List<Object> get props => [
        sender_id,
        receiver_id,
        sent_at,
        is_accepted,
      ];

  Map<String, dynamic> toJson() {
    return {
      'sender_id': sender_id,
      'receiver_id': receiver_id,
      'sent_at': sent_at,
      'responded_at': responded_at,
      'is_accepted': is_accepted,
    };
  }
}
