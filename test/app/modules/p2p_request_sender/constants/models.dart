import 'package:dartz/dartz.dart';
import 'package:primala/app/modules/p2p_request_sender/data/models/p2p_request_recipient_model.dart';
import 'package:primala/app/modules/p2p_request_sender/data/models/p2p_request_sender_status_model.dart';

class ConstantModels {
  static get successfulP2PRequestStatusModel =>
      const Right(P2PRequestSenderStatusModel(isSent: true));

  static get notSuccessfulP2PRequestStatusModel =>
      const Right(P2PRequestSenderStatusModel(isSent: false));

  static get unwrappedSuccessfulP2PRequestStatusModel =>
      const P2PRequestSenderStatusModel(isSent: true);

  static get unwrappedNotSuccessfulP2PRequestStatusModel =>
      const P2PRequestSenderStatusModel(isSent: false);

  static get successfulRecipientModel => const Right(
        P2PRequestSenderRecipientModel(
          exists: true,
          dupRecip: false,
          dupSender: false,
        ),
      );

  static get recipientDuplicateRecipientModel => const Right(
        P2PRequestSenderRecipientModel(
          exists: true,
          dupRecip: true,
          dupSender: false,
        ),
      );

  static get senderDuplicateRecipientModel => const Right(
        P2PRequestSenderRecipientModel(
          exists: true,
          dupRecip: false,
          dupSender: true,
        ),
      );

  static get unwrappedSuccessfulRecipientModel =>
      const P2PRequestSenderRecipientModel(
        exists: true,
        dupRecip: false,
        dupSender: false,
      );

  static get unwrappedSenderDuplicateRecipientModel =>
      const P2PRequestSenderRecipientModel(
        exists: true,
        dupRecip: false,
        dupSender: true,
      );

  static get unwrappedRecipientDuplicateRecipientModel =>
      const P2PRequestSenderRecipientModel(
        exists: true,
        dupRecip: true,
        dupSender: false,
      );
}
