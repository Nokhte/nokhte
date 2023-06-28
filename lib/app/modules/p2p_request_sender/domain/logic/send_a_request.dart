// * Domain Imports
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/contracts/p2p_request_sender_contract.dart';
import 'package:primala/app/modules/p2p_request_sender/domain/entities/p2p_request_sender_status_entity.dart';

class SendARequest extends AbstractFutureLogic<P2PRequestSenderStatusEntity,
    P2PSendReqParams> {
  final P2PRequestSenderContract contract;

  SendARequest({required this.contract});

  @override
  Future<Either<Failure, P2PRequestSenderStatusEntity>> call(
          P2PSendReqParams params) async =>
      await contract.sendARequest(params.username);
}

class P2PSendReqParams extends Equatable {
  final String username;

  const P2PSendReqParams({required this.username});

  @override
  List<Object> get props => [username];
}
