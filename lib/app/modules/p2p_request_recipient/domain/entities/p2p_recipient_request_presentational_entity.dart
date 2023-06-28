import 'package:equatable/equatable.dart';

class P2PRecipientRequestPresentationalEntity extends Equatable {
  final List<P2PPresentationalRecipientRequest> requests;

  const P2PRecipientRequestPresentationalEntity({
    required this.requests,
  });

  @override
  List<Object> get props => [requests];
}

class P2PPresentationalRecipientRequest extends Equatable {
  final String relativeTimeString;
  final String senderUsername;

  const P2PPresentationalRecipientRequest({
    required this.relativeTimeString,
    required this.senderUsername,
  });

  @override
  List<Object> get props => [relativeTimeString, senderUsername];
}
