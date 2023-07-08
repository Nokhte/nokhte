import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/entities/p2p_recipient_request_entity.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/entities/p2p_recipient_response_status_entity.dart';

abstract class P2PRequestRecipientContract {
  Future<Either<Failure, P2PRecipientRequestEntity>> loadTheRequests();
  Future<Either<Failure, P2PRequestRecipientResponseStatusEntity>>
      respondToARequest(String senderUsername);
}
