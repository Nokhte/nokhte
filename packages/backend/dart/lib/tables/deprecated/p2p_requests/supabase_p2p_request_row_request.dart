// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';

/// @dev Strict Typing for the Body of the Query
class SupabaseP2PRequestRowRequest extends Equatable {
  final String sender_id;
  final String receiver_id;

  SupabaseP2PRequestRowRequest({
    required this.sender_id,
    required this.receiver_id,
  });

  @override
  List<Object> get props => [
        sender_id,
        receiver_id,
      ];

  Map<String, dynamic> toJson() {
    return {
      'sender_id': sender_id,
      'receiver_id': receiver_id,
    };
  }
}
