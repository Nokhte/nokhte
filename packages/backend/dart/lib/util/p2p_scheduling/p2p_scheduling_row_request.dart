import 'package:equatable/equatable.dart';

class P2PSchedulingRequest extends Equatable {
  final String senderId;
  final String receiverId;
  final Map<String, dynamic> initialTimeRanges;

  P2PSchedulingRequest({
    required this.senderId,
    required this.receiverId,
    required this.initialTimeRanges,
  });

  Map<String, dynamic> toJson() {
    return {
      'sender_id': senderId,
      'receiver_id': receiverId,
      'initial_time_ranges': initialTimeRanges,
    };
  }

  @override
  List<Object?> get props => [
        senderId,
        receiverId,
        initialTimeRanges,
      ];
}
