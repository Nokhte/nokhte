// * Domain Imports
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/contracts/p2p_request_sender_contract.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/entities/p2p_request_recipient_entity.dart';

class ValidateRequest extends AbstractFutureLogic<P2PRequestRecipientEntity,
    P2PReqRecipientParams> {
  final P2PRequestSenderContract contract;

  ValidateRequest({required this.contract});

  @override
  Future<Either<Failure, P2PRequestRecipientEntity>> call(
          P2PReqRecipientParams params) async =>
      await contract.validateRequest(params.username);
}

class P2PReqRecipientParams extends Equatable {
  final String username;

  const P2PReqRecipientParams({required this.username});

  @override
  List<Object> get props => [username];
}
