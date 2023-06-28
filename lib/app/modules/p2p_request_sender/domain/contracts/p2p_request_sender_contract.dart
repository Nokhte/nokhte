import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/entities/p2p_request_sender_status_entity.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/entities/p2p_request_recipient_entity.dart';

abstract class P2PRequestSenderContract {
  Future<Either<Failure, P2PRequestSenderStatusEntity>> sendARequest(
      String receiverUsername);
  Future<Either<Failure, P2PRequestRecipientEntity>> validateRequest(
      String receiverUsername);
}
