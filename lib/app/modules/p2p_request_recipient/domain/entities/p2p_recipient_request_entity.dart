import 'package:equatable/equatable.dart';

class P2PRecipientRequestEntity extends Equatable {
  final List<P2PRecipientRequest> requests;

  const P2PRecipientRequestEntity({required this.requests});

  @override
  List<Object> get props => [requests];
}

class P2PRecipientRequest extends Equatable {
  final String timestampz;
  final String senderUsername;

  const P2PRecipientRequest({
    required this.timestampz,
    required this.senderUsername,
  });

  @override
  List<Object> get props => [timestampz, senderUsername];
}
