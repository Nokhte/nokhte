import 'package:equatable/equatable.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/deprecated/p2p_scheduling_sender/domain/contracts/p2p_scheduling_sender_contract.dart';
import 'package:primala/app/modules/deprecated/p2p_scheduling_sender/domain/entities/confirm_p2p_scheduling_time_status_entity.dart';

class ConfirmSchedulingTime extends AbstractFutureLogic<
    ConfirmP2PSchedulingTimeStatusEntity, ConfirmSchedulingTimeParams> {
  final P2PSchedulingSenderContract contract;

  ConfirmSchedulingTime({required this.contract});

  @override
  Future<Either<Failure, ConfirmP2PSchedulingTimeStatusEntity>> call(
      ConfirmSchedulingTimeParams params) async {
    return await contract.confirmSchedulingTime(
        receiverUID: params.receiverUID);
  }
}

class ConfirmSchedulingTimeParams extends Equatable {
  final String receiverUID;

  const ConfirmSchedulingTimeParams({required this.receiverUID});

  @override
  List<Object> get props => [receiverUID];
}
