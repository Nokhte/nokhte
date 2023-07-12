import 'package:primala/app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/deprecated/p2p_scheduling_recipient/domain/contracts/p2p_scheduling_recipient_contract.dart';
import 'package:primala/app/modules/deprecated/p2p_scheduling_recipient/domain/entities/p2p_scheduling_response_status_entity.dart';
import 'package:primala/app/modules/deprecated/p2p_scheduling_recipient/domain/entities/respond_to_scheduling_request_param_entity.dart';

class RespondToSchedulingRequest extends AbstractFutureLogic<
    P2PSchedulingResponseStatusEntity, RespondToSchedulingRequestParamEntity> {
  final P2PSchedulingRecipientContract contract;

  RespondToSchedulingRequest({required this.contract});

  @override
  Future<Either<Failure, P2PSchedulingResponseStatusEntity>> call(
      RespondToSchedulingRequestParamEntity params) async {
    return await contract.respondToSchedulingRequest(params);
  }
}
