import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/contracts/p2p_request_recipient_contract.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/entities/p2p_recipient_response_status_entity.dart';

class RespondToARequest extends AbstractFutureLogic<
    P2PRequestRecipientResponseStatusEntity, P2PRespondToReqParams> {
  final P2PRequestRecipientContract contract;

  RespondToARequest({required this.contract});

  @override
  Future<Either<Failure, P2PRequestRecipientResponseStatusEntity>> call(
          P2PRespondToReqParams params) async =>
      await contract.respondToARequest(params.senderUsername);
}

class P2PRespondToReqParams extends Equatable {
  final String senderUsername;

  const P2PRespondToReqParams({required this.senderUsername});
  @override
  List<Object> get props => [senderUsername];
}
