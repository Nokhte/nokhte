import 'package:primala/app/modules/p2p_request_sender/domain/entities/p2p_request_recipient_entity.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/entities/p2p_request_sender_status_entity.dart';

class ConstantEntities {
  static get successfulP2PRequestStatusEntity =>
      const P2PRequestSenderStatusEntity(isSent: true);
  static get notSuccessfulP2PRequestStatusEntity =>
      const P2PRequestSenderStatusEntity(isSent: false);
  static get successfulRecipientEntity => const P2PRequestRecipientEntity(
        exists: true,
        duplicateRecipient: false,
        duplicateSender: false,
      );
  static get alreadyReceivedRequestRecipientEntity =>
      const P2PRequestRecipientEntity(
        exists: true,
        duplicateRecipient: true,
        duplicateSender: false,
      );
  static get alreadySentRequestRecipientEntity =>
      const P2PRequestRecipientEntity(
        exists: true,
        duplicateRecipient: false,
        duplicateSender: true,
      );
}
