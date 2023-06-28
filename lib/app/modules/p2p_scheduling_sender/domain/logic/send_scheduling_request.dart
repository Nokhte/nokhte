import 'package:primala/app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/domain/contracts/p2p_scheduling_sender_contract.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/domain/entities/p2p_scheduling_request_status_entity.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/domain/entities/send_scheduling_request_param_entity.dart';

class SendSchedulingRequest extends AbstractFutureLogic<
    P2PSchedulingRequestStatusEntity, SendSchedulingRequestParamEntity> {
  final P2PSchedulingSenderContract contract;

  SendSchedulingRequest({required this.contract});

  @override
  Future<Either<Failure, P2PSchedulingRequestStatusEntity>> call(
      SendSchedulingRequestParamEntity params) async {
    return await contract.sendSchedulingRequest(
      schedulingInfoEntity: params,
    );
  }
}
